import re
import numpy as np
import pandas as pd
import preprocess_kgptalkie as ps
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
from sklearn.svm import LinearSVC
import joblib
import numpy as np
from flask import Flask, request, jsonify

app = Flask(__name__)

df_depression_model = pd.read_csv("data/ML Model and API/Depression Detection/Modelling/dataset.csv")
df_schizophrenia = pd.read_csv("data/ML Model and API/Schizophrenia Detection/Model/dataset.csv")
df_suicide = pd.read_csv("data/ML Model and API/Suicide Detection/suicide_dataset.csv")

def get_clean(x):
    x = str(x).lower().replace('\\', '').replace('_', ' ')
    x = ps.cont_exp(x)
    x = ps.remove_emails(x)
    x = ps.remove_urls(x)
    x = ps.remove_html_tags(x)
    x = ps.remove_rt(x)
    x = ps.remove_accented_chars(x)
    x = ps.remove_special_chars(x)
    x = re.sub("(.)\\1{2,}", "\\1", x)
    return x

tfidf_depression = TfidfVectorizer(max_features=20000, ngram_range=(1,3), analyzer='char')
tfidf_schizophrenia = TfidfVectorizer(max_features=20000, ngram_range=(1,3), analyzer='char')
tfidf_suicide = TfidfVectorizer(max_features=20000, ngram_range=(1,3), analyzer='char')

X_depression_model = tfidf_depression.fit_transform(df_depression_model['text'])
y_depression_model = df_depression_model['label']

X_df_schizophrenia = tfidf_schizophrenia.fit_transform(df_schizophrenia['text'])
y_df_schizophrenia = df_schizophrenia['label']

df_suicide['tweet'] = df_suicide['tweet'].apply(lambda x: get_clean(x))
X_suicide = tfidf_suicide.fit_transform(df_suicide['tweet'])
y_suicide = df_suicide['intention']
x_train, x_test, y_train, y_test = train_test_split(X_suicide,y_suicide, test_size=0.2, random_state=0)
model_suicide = LinearSVC()
model_suicide.fit(x_train,y_train)
y_pred = model_suicide.predict(x_test)
t = "My whole life has just been mistakes and failings. When I look back on my past it’s all I see. When I look toward the future it’s all I see. I truly am an idiot and a fuckup. I am often called a loser or other such things. No use in disagreeing with the truth. Things could have been different if I had used my brain, but I’m clearly too stupid for that. I wish I could be saved, to be happy, and for others to be happy too."
u = "I had an amazing day. I got a 100$ note on the way to subway."

def predict_tendency_depression_model(model, x):
    x = get_clean(x)
    vec = tfidf_depression.transform([x])
    if model.predict(vec)[0] == 1:
        print("Anxious")
    elif model.predict(vec)[0] == 2:
        return ("Depressed")
    else:
        return ("Normal")

def predict_tendency_schizophrenia(model, x):
    x = get_clean(x)
    vec = tfidf_schizophrenia.transform([x])
    # print(vec.shape)
    if model.predict(vec)[0] == 1:
        return("Schizophrenic")
    else:
        return("Not Schizophrenic")

def predict_tendency_suicide(model, x):
    x = get_clean(x)
    vec = tfidf_suicide.transform([x])
    if model.predict(vec)[0] == 1:
        return("Suicidal")
    else:
        return("Not Suicidal")

thismodel_depression_model = joblib.load("data/ML Model and API/Depression Detection/Modelling/DepressionModel.pkl")

thismodel_schizophrenia = joblib.load("data/ML Model and API/Schizophrenia Detection/Model/SchizoModel.pkl")

# predict_tendency_suicide(model_suicide, t)
# predict_tendency_suicide(model_suicide, u)

thismodel = joblib.load('data/ML Model and API/Suicide Detection/SuicideModel.pkl')

@app.route('/predictDepression',methods=['POST'])
def predict_depression():
    data = request.get_json(force=True)  
    # print(data)
    output = predict_tendency_depression_model(thismodel_depression_model, data['input'])
    return jsonify(output)

@app.route('/predictSchizophrenia',methods=['POST'])
def predict_schizophrenia():
    data = request.get_json(force=True)  
    # print(data)
    output = predict_tendency_schizophrenia(thismodel_schizophrenia, data['input'])
    return jsonify(output)

@app.route('/predictSuicidal',methods=['POST'])
def predict_suicidal():
    data = request.get_json(force=True)  
    # print(data)
    output = predict_tendency_suicide(thismodel, data['input'])
    return jsonify(output)

if __name__ == '__main__':
    print("server is up!")
    app.run(port=5000, debug=True)