from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
db = SQLAlchemy()

class CheckIn(db.Model):
    #example model from tutorial
    __tablename__ = 'daily_checkin'
    id = db.Column('checkin_id', db.Integer, primary_key=True)
    user_id = db.Column(db.String)
    text = db.Column(db.String)
    sentiment = db.Column(db.Float)
    emotion = db.Column(db.String)
    date = db.Column(db.DateTime)

    def __init__(self, user_id, text, sentiment, emotion="None"):
        self.user_id = user_id
        self.text = text
        self.sentiment = sentiment
        self.emotion = emotion
        self.date = datetime.utcnow()


# class User(db.Model):
#     __tablename__ = 'user'
#     id = db.Column(db.Integer, primary_key=True)
#     name = db.Column(db.String)
#     children = db.relationship("CheckIn")
#
#     def __init__(self, name):
#         self.name = name
