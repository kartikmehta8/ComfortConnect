import requests

def get_emotion(text_content):
    url = "https://proxy.api.deepaffects.com/text/generic/api/latest/sync/text_recognise_emotion"
    querystring = {"apikey":"c5p9y8fyaw7Jo6qH17AtHIirW0iLKqf9"}
    payload = {"content": text_content}
    headers = {
        'Content-Type': "application/json",
    }

    response = requests.post(url, json=payload, headers=headers, params=querystring)
    return response
