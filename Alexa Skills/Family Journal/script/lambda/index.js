const fetch = require("node-fetch");
const Alexa = require("ask-sdk-core");

var counter = 0;
var text = "";

const LaunchRequestHandler = {
    canHandle(handlerInput) {
        return (
            Alexa.getRequestType(handlerInput.requestEnvelope) ===
            "LaunchRequest"
        );
    },
    handle(handlerInput) {
        const speakOutput = `Hi! Welcome back`;

        counter = 0;

        return handlerInput.responseBuilder
            .speak(speakOutput)
            .reprompt(speakOutput)
            .getResponse();
    },
};

exports.getEmotionData = async (text, user_id, method) => {
    const host = "35.227.70.235";
    const port = "5000";
    const path = `api/emotion/${user_id}`;
    const settings = {
        method: method,
        headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
        },
    };
    if (method === "POST") {
        settings.body = JSON.stringify({ text: text });
    }

    try {
        const fetchResponse = await fetch(
            `http://${host}:${port}/${path}`,
            settings
        );
        const data = await fetchResponse.json();
        return data;
    } catch (e) {
        return e;
    }
};

const getResponseIntentHandler = {
    canHandle(handlerInput) {
        return counter === 0;
    },
    async handle(handlerInput) {
        const userId = Alexa.getUserId(handlerInput.requestEnvelope).slice(
            -10,
            -1
        );
        text = handlerInput.requestEnvelope.request.intent.slots.response.value;
        // key: first letter of emotion + p/n/l (positive trend/negative trend/low r2)
        var dict = {
            ap: [
                "Everyone has a bad day sometimes. Im sure tomorrow will be better!",
                "When I get angry, I find it helpful to take a step back and collect myself.",
                "Dont let one bad day get you down!",
            ],
            an: [
                "Everyone has a bad day sometimes. Im sure tomorrow will be better!",
                "When I get angry, I find it helpful to take a step back and collect myself.",
            ],
            al: [
                "It might be useful to keep in mind that anger usually doesn’t solve anything.",
                "When I get angry, I find it helpful to take a step back and collect myself.",
            ],
            dp: ["Im sorry you feel that way."],
            dn: ["Im sorry you feel that way."],
            dl: ["Im sorry you feel that way."],
            fp: ["Things will always turn out okay."],
            fn: [
                "When I feel anxious, it helps to take a step back and relax.",
                "Even if things seem bad now, they can always get better.",
            ],
            fl: ["Everything is going to be ok."],
            jp: [
                "Im happy things have been going great for you lately!",
                "It seems like things have been going pretty well lately! Keep it up!",
                "Glad to hear it!",
                "I like the pep in your step!",
            ],
            jn: [
                "Im glad you had a good day!",
                "Glad to hear it!",
                "I like the pep in your step!",
            ],
            jl: [
                "Im glad you had a good day!",
                "Glad to hear it!",
                "I like the pep in your step!",
            ],
            np: [
                "If you need a pick me up, I suggest watching a good movie or listening to music.",
                "If you need a pick me up, I suggest curling up with a good book and some hot chocolate.",
            ],
            nn: [
                "If you need a pick me up, I suggest watching a good movie or listening to music.",
                "If you need a pick me up, I suggest curling up with a good book and some hot chocolate.",
            ],
            nl: [
                "If you need a pick me up, I suggest watching a good movie or listening to music.",
                "If you need a pick me up, I suggest curling up with a good book and some hot chocolate.",
            ],
            sp: [
                "Everyone has a bad day sometimes. Im sure tomorrow will be better!",
                "Even if today was bad, tomorrow is a new day!",
            ],
            sn: [
                "Im sorry that you haven’t been feeling well lately. I would recommend calling National Alliance on Mental Illness Hotline.",
                "It seems that you have not been feeling well lately but remember that tomorrow is always a new day!",
                "Im sure things will pick up soon!",
            ],
            sl: [
                "Im sorry that you had a bad day. Im sure tomorrow will be better!",
            ],
            up: [
                "You sound ready for the day!",
                "I like the pep in your step!",
                "That sounds exciting!",
                "You seem surprised.",
                "You seem excited!",
                "You seem astonished.",
                "You seem shocked.",
            ],
            un: [
                "You seem surprised.",
                "You seem excited!",
                "You seem astonished.",
                "You seem shocked.",
            ],
            ul: [
                "You seem surprised.",
                "You seem excited!",
                "You seem astonished.",
                "You seem shocked.",
            ],
            tp: ["Thank you for telling me."],
            tn: ["Thank you for telling me. I appreciate hearing from you."],
            tl: ["Thank you for taking the time to share with me."],
        };

        var speakOutput = "";
        if (
            text.includes("want to die") ||
            text.includes("kill myself") ||
            text.includes("suicide")
        ) {
            speakOutput =
                "You are not alone. To get help, call the suicide hotline at 800-273-8255. You can get through this.";

            return handlerInput.responseBuilder
                .speak(speakOutput)
                .getResponse();
        }

        var data = await exports.getEmotionData(text, userId, "POST");
        const moodSentiment =
            data["emotion"][0] +
            (data["r2"] > 0.5 ? (data["slope"] > 0 ? "p" : "n") : "l");
        console.log(moodSentiment);
        speakOutput =
            dict[moodSentiment][
                Math.floor(Math.random() * dict[moodSentiment].length)
            ] +
            " Would you like to hear how you have been doing over these past two weeks?";

        counter += 1;

        return handlerInput.responseBuilder
            .speak(speakOutput)
            .reprompt(speakOutput)
            .getResponse();
    },
};

const YesIntentHandler = {
    canHandle(handlerInput) {
        return (
            counter === 1 &&
            Alexa.getRequestType(handlerInput.requestEnvelope) ===
                "IntentRequest" &&
            Alexa.getIntentName(handlerInput.requestEnvelope) ===
                "AMAZON.YesIntent"
        );
    },

    async handle(handlerInput) {
        const userId = Alexa.getUserId(handlerInput.requestEnvelope).slice(
            -10,
            -1
        );
        var data = await exports.getEmotionData(text, userId, "GET");
        const sentiment =
            data["average_sentiment"] < 0.3 && data["average_sentiment"] > -0.3
                ? "okay"
                : data["average_sentiment"] > 0
                ? "good"
                : "bad";
        const change =
            data["slope"] < 0.5 && data["slope"] > -0.5
                ? "stayed the same"
                : data["slope"] > 0
                ? "gotten better"
                : "gotten worse";
        const fluctuations =
            data["r2"] < 0.3 ? "many" : data["r2"] > 0.7 ? "little" : "some";
        const speakOutput = `Over the past two weeks, you have been ${sentiment} and your mood has generally ${change}. You've felt ${data["most_freq_emotion"]} most frequently, and you've have ${fluctuations} fluctuations in mood. `;
        counter += 1;
        return handlerInput.responseBuilder.speak(speakOutput).getResponse();
    },
};

const ExitHandler = {
    canHandle(handlerInput) {
        return true;
    },

    async handle(handlerInput) {
        return handlerInput.responseBuilder.speak("").getResponse();
    },
};

/**
 * This handler acts as the entry point for our skill, routing all request and response
 * payloads to the handlers above. All new handlers or interceptors defined need to be
 * included below. The order matters - they're processed top to bottom
 * */
exports.handler = Alexa.SkillBuilders.custom()
    .addRequestHandlers(
        LaunchRequestHandler,
        getResponseIntentHandler,
        YesIntentHandler,
        ExitHandler
    )
    .withCustomUserAgent("sample/ketchup/v1.0.0")
    .withApiClient(new Alexa.DefaultApiClient())
    .lambda();
