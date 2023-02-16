import argparse
from google.cloud import language_v1
#   export GOOGLE_APPLICATION_CREDENTIALS="/Users/gracetian/Desktop/hackduke2020/backend/google-app-cred.json"

def get_sentiment(text_content):
    """
    Analyzing Sentiment in a String

    Args:
      text_content The text content to analyze
    """

    client = language_v1.LanguageServiceClient()

    # Available types: PLAIN_TEXT, HTML
    type_ = language_v1.enums.Document.Type.PLAIN_TEXT

    # Optional. If not specified, the language is automatically detected.
    # For list of supported languages:
    # https://cloud.google.com/natural-language/docs/languages
    language = "en"
    document = {"content": text_content, "type": type_, "language": language}

    # Available values: NONE, UTF8, UTF16, UTF32
    encoding_type = language_v1.enums.EncodingType.UTF8

    response = client.analyze_sentiment(document, encoding_type)
    # # Get overall sentiment of the input document
    # print(u"Document sentiment score: {}".format(response.document_sentiment.score))
    # print(
    #     u"Document sentiment magnitude: {}".format(
    #         response.document_sentiment.magnitude
    #     )
    # )
    # # Get sentiment for all sentences in the document
    # for sentence in response.sentences:
    #     print(u"Sentence text: {}".format(sentence.text.content))
    #     print(u"Sentence sentiment score: {}".format(sentence.sentiment.score))
    #     print(u"Sentence sentiment magnitude: {}".format(sentence.sentiment.magnitude))

    # # Get the language of the text, which will be the same as
    # # the language specified in the request or, if not specified,
    # # the automatically-detected language.
    # print(u"Language of the text: {}".format(response.language))

    return response

# def print_result(annotations):
#     score = annotations.document_sentiment.score
#     magnitude = annotations.document_sentiment.magnitude

#     for index, sentence in enumerate(annotations.sentences):
#         sentence_sentiment = sentence.sentiment.score
#         print(
#             "Sentence {} has a sentiment score of {}".format(index, sentence_sentiment)
#         )

#     print(
#         "Overall Sentiment: score of {} with magnitude of {}".format(score, magnitude)
#     )
#     return 0

# if __name__ == "__main__":
#     text_content = 'I am so happy and joyful.'
#     annotations = sample_analyze_sentiment(text_content)
#     print_result(annotations)
