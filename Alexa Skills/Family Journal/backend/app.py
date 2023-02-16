from flask import Flask, jsonify, abort, make_response
from flask_restful import Api, Resource, reqparse, fields, marshal
import sqlalchemy.orm
from cockroachdb.sqlalchemy import run_transaction
from models import CheckIn, db
from sentiment import get_sentiment
from emotion import get_emotion
import json
from scipy import stats
import numpy

app = Flask(__name__, static_url_path="")
api = Api(app)
app.config.from_pyfile('ketchup.cfg')
app.app_context().push()
db.init_app(app)
# CheckIn.__table__.drop(db.engine)
db.create_all()
sessionmaker = sqlalchemy.orm.sessionmaker(db.engine)

class EmotionTranslater(Resource):
    def __init__(self):
        self.reqparse = reqparse.RequestParser()
        self.reqparse.add_argument('text', type=str, required=True,
                                   help='No response provided',
                                   location='json')
        super(EmotionTranslater, self).__init__()

    # ketchup: checkin text from alexa
    def add_checkin_to_db(self, ketchup):
        def callback(session):
            session.add(ketchup)
        run_transaction(sessionmaker, callback)

    # user_id: user id from alexa
    def checkin_by_user(self, user_id):
        def callback(session):
            ketchup_bottle = session.query(CheckIn).filter_by(user_id=user_id).order_by(CheckIn.date.desc()).limit(20).all()
            session.expunge_all()
            return ketchup_bottle
        return run_transaction(sessionmaker, callback)


    def get_data(self, id):
        ketchup_bottle = self.checkin_by_user(id)
        print(ketchup_bottle)

        # include analysis parameters:
        values = [ketchup.sentiment for ketchup in ketchup_bottle]
        dates = [ketchup.date.timestamp() for ketchup in ketchup_bottle]
        average = numpy.average(values)
        emotions = {}
        for ketchup in ketchup_bottle:
            emotions.setdefault(ketchup.emotion, 0)
            emotions[ketchup.emotion] += 1
        emotions = [(emotions[key], key) for key in emotions]
        most_common = max(emotions)[1]
        slope, intercept, r_value, p_value, std_err = stats.linregress(dates, values)
        r2 = r_value ** 2
        return most_common, average, slope, r2

    # id: user id from alexa
    def get(self, id):
        # ketchup_bottle: all data from that user

        #   - average sentiment over 2 week period
        #   - most frequent emotion
        #   - average rate of change of sentiment over 2 week period
        most_common, average, slope, r2 = self.get_data(id)
        return jsonify({"most_freq_emotion": most_common, "average_sentiment": average, "slope": slope, "r2": r2})

    def post(self, id):
        args = self.reqparse.parse_args()
        text = args["text"]
        
        # getting sentiment analysis from google nlp api
        annotations = get_sentiment(text)
        sentiment = annotations.document_sentiment.score

        # getting emotion from deepaffects text api
        emotion = list(json.loads(get_emotion(text).text)["response"].keys())[0]
        ketchup = CheckIn(id, text, sentiment, emotion)
        self.add_checkin_to_db(ketchup)
        most_common, average, slope, r2 = self.get_data(id)
        return jsonify({"emotion": emotion, "sentiment": sentiment, "most_freq_emotion": most_common, "average_sentiment": average, "slope": slope, "r2": r2})

api.add_resource(EmotionTranslater, '/api/emotion/<string:id>', endpoint='tasks')


if __name__ == '__main__':
    # app.run(debug=True)
    app.run(host='0.0.0.0')
