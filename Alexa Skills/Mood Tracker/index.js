"use strict";
const Alexa = require("alexa-sdk");

//Replace with your app ID (OPTIONAL).  You can find this value at the top of your skill's page on http://developer.amazon.com.
//Make sure to enclose your value in quotes, like this: const APP_ID = 'amzn1.ask.skill.bb4045e6-b3e8-4133-b650-72923c5980f1';
const APP_ID = "amzn1.ask.skill.9300e129-9bb5-4a95-b959-dac21242d2e0";

const SKILL_NAME = "Mood Tracker";
const HELP_MESSAGE =
    "You can tell me how you're feeling, or, you can say exit... What can I help you with?";
const HELP_REPROMPT = "How are you feeling?";
const STOP_MESSAGE = "Goodbye!";

var happy = [];
var sad = [];
var angry = [];
var indifferent = [];
var totalNumMoods = 0;

function createMood(currentMood) {
    var currentTime = new Date();
    var currentDate = new Date();
    currentTime =
        currentTime.toLocaleTimeString() +
        " " +
        currentDate.toLocaleDateString();

    if (
        currentMood == "happy" ||
        currentMood == "cheerful" ||
        currentMood == "joyful" ||
        currentMood == "content"
    ) {
        happy.push(currentTime);
    } else if (
        currentMood == "sad" ||
        currentMood == "depressed" ||
        currentMood == "unhappy" ||
        currentMood == "down"
    ) {
        sad.push(currentTime);
    } else if (
        currentMood == "angry" ||
        currentMood == "mad" ||
        currentMood == "frustrated" ||
        currentMood == "livid"
    ) {
        angry.push(currentTime);
    } else if (
        currentMood == "indifferent" ||
        currentMood == "okay" ||
        currentMood == "alright" ||
        currentMood == "whatever"
    ) {
        indifferent.push(currentTime);
    }
    totalNumMoods = totalNumMoods + 1;
}

function findPercentage() {
    var percentages = [];
    var setnum = (happy.length / totalNumMoods) * 100;
    percentages[0] = setnum.toFixed(2);
    setnum = (sad.length / totalNumMoods) * 100;
    percentages[1] = setnum.toFixed(2);
    setnum = (angry.length / totalNumMoods) * 100;
    percentages[2] = setnum.toFixed(2);
    setnum = (indifferent.length / totalNumMoods) * 100;
    percentages[3] = setnum.toFixed(2);
    return percentages;
}
function getMoodArray(moodType) {
    if (moodType == "happy") {
        return happy;
    } else if (moodType == "sad") {
        return sad;
    } else if (moodType == "angry") {
        return angry;
    } else if (moodType == "indifferent") {
        return indifferent;
    }
}

exports.handler = function (event, context, callback) {
    var alexa = Alexa.handler(event, context);
    alexa.appId = APP_ID;
    alexa.registerHandlers(handlers);
    alexa.execute();
};

const handlers = {
    LaunchRequest: function () {
        this.response
            .speak("How are you feeling?")
            .listen("I didn't catch that. How are you feeling?");
        this.emit(":responseReady");
    },
    GiveMoodIntent: function () {
        var cMood = this.event.request.intent.slots.MoodType.value;
        createMood(cMood);
        this.response.speak(
            "Thanks for sharing. Your mood, " +
                cMood +
                ", has been logged. You now have " +
                totalNumMoods +
                " moods logged."
        );
        this.emit(":responseReady");
    },
    GetMoodReview: function () {
        var percent = findPercentage();
        var output =
            "You have been happy " +
            percent[0] +
            " percent of the time. You have been sad " +
            percent[1] +
            " percent of the time. You have been angry " +
            percent[2] +
            " percent of the time. You have been indifferent " +
            percent[3] +
            " percent of the time.";
        this.response.speak(output);
        this.emit(":responseReady");
    },
    GetMoodTimestamps: function () {
        var cMood = this.event.request.intent.slots.MoodType.value;
        var timestamps = getMoodArray(cMood);
        var tsString = "Here are your logs for " + cMood + ": ";
        for (var i = 0; i < timestamps.length; i++) {
            tsString += timestamps[i];
            if (i != timestamps.length) tsString += ", ";
        }
        this.response.speak(tsString);
        this.emit(":responseReady");
    },
    "AMAZON.HelpIntent": function () {
        const speechOutput = HELP_MESSAGE;
        const reprompt = HELP_REPROMPT;

        this.response.speak(speechOutput).listen(reprompt);
        this.emit(":responseReady");
    },
    "AMAZON.CancelIntent": function () {
        this.response.speak(STOP_MESSAGE);
        this.emit(":responseReady");
    },
    "AMAZON.StopIntent": function () {
        this.response.speak(STOP_MESSAGE);
        this.emit(":responseReady");
    },
};
