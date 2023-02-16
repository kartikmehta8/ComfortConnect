"use strict";
const Alexa = require("alexa-sdk");

const fightData = require("data/fight-data");
const interviewData = require("data/interview-data");
const feelingData = require("data/feeling-data");
const helperFn = require("helpers");
const message = require("helpers/messages");

//Replace with your app ID (OPTIONAL).  You can find this value at the top of your skill's page on http://developer.amazon.com.
//Make sure to enclose your value in quotes, like this: const APP_ID = 'amzn1.ask.skill.bb4045e6-b3e8-4133-b650-72923c5980f1';
const APP_ID = "amzn1.ask.skill.2dc9e043-fa39-488f-ab21-844acffc2609";
const SKILL_NAME = "Morale Booster";

const handlers = {
    LaunchRequest: function () {
        this.emit("WelcomeIntent");
    },
    WelcomeIntent: function () {
        const speechOutput =
            message.getWelcomeMessage() + " " + message.getHelpMessage();
        this.emit(":tell", speechOutput);
    },
    FightIntent: function () {
        const intentObj = this.event.request.intent;

        // Prompt for slot data
        if (!intentObj.slots.person.value) {
            // get slot: person
            const slotToElicit = "person";
            const speechOutput = helperFn.getRandomValue(
                fightData.getPersonSpeakout()
            );
            const updatedIntent = "FightIntent";
            this.emit(":elicitSlot", slotToElicit, speechOutput, updatedIntent);
        } else if (!intentObj.slots.reason.value) {
            // get slot: reason
            const slotToElicit = "reason";
            const speechOutput = helperFn.getRandomValue(
                fightData.getReasonSpeakout()
            );
            const updatedIntent = "FightIntent";
            this.emit(":elicitSlot", slotToElicit, speechOutput, updatedIntent);
        }

        const person = intentObj.slots.person.value;
        const reason = intentObj.slots.reason.value;
        const suggestion = helperFn.getFightSuggestion(person, reason);

        this.emit(":ask", suggestion, "Do you like any other suggestion?");
        //this.response.speak(suggestion).listen('Do you like any other suggestion');
        //this.emit(':responseReady');

        //this.emit(':tell', suggestion);
        //this.emit(':ask', 'Do you like any other suggestion', 'Please say that again?');
    },
    InterviewIntent: function () {
        const intentObj = this.event.request.intent;

        // Prompt for slot data
        if (!intentObj.slots.company.value) {
            // get slot: company
            const slotToElicit = "company";
            const speechOutput = helperFn.getRandomValue(
                interviewData.getCompanySpeakout()
            );
            const updatedIntent = "InterviewIntent";
            this.emit(":elicitSlot", slotToElicit, speechOutput, updatedIntent);
        } else if (!intentObj.slots.when.value) {
            // get slot: when
            const slotToElicit = "when";
            const speechOutput = helperFn.getRandomValue(
                interviewData.getWhenSpeakout()
            );
            const updatedIntent = "InterviewIntent";
            this.emit(":elicitSlot", slotToElicit, speechOutput, updatedIntent);
        }

        const company = intentObj.slots.company.value;
        const when = intentObj.slots.when.value;
        const hope = helperFn.getInterviewReplies(company, when);

        this.emit(":ask", hope, "Do you like any other suggestion?");
        //this.emit(':tell', hope);
    },
    FeelingIntent: function () {
        const intentObj = this.event.request.intent;

        // Prompt for slot data
        if (!intentObj.slots.emotion.value) {
            // get slot: emotion
            const slotToElicit = "emotion";
            const speechOutput = helperFn.getRandomValue(
                feelingData.getEmotionSpeakout()
            );
            const updatedIntent = "FeelingIntent";
            this.emit(":elicitSlot", slotToElicit, speechOutput, updatedIntent);
        } /* else if (!intentObj.slots.cause.value) {
            // get slot: cause
            const slotToElicit = 'cause';
            const speechOutput = helperFn.getRandomValue(feelingData.getCauseSpeakout());
            const updatedIntent = 'FeelingIntent';
            this.emit(':elicitSlot', slotToElicit, speechOutput, updatedIntent);
        } */

        const emotion = intentObj.slots.emotion.value;
        //const cause = intentObj.slots.cause.value;
        const suggestion =
            "I would suggest you to " + helperFn.getFeelingSuggestion(emotion);

        this.emit(":ask", suggestion, "Do you like any other suggestion?");
        //this.emit(':tell', suggestion);
    },
    YesIntent: function () {
        this.emit(":ask", message.getAgainMessage(), "Please let me help you?");
    },
    NoIntent: function () {
        this.emit(":tell", "It was nice to help you!");
    },
    "AMAZON.HelpIntent": function () {
        const speechOutput = message.getHelpMessage();
        const reprompt = message.getHelpMessage();
        this.response.speak(speechOutput).listen(reprompt);
        this.emit(":responseReady");
    },
    "AMAZON.CancelIntent": function () {
        const speechOutput = message.getCancelMessage();
        this.response.speak(speechOutput);
        this.emit(":responseReady");
    },
    "AMAZON.StopIntent": function () {
        const speechOutput = message.getStopMessage();
        this.response.speak(speechOutput);
        this.emit(":responseReady");
    },
};

exports.handler = function (event, context, callback) {
    const alexa = Alexa.handler(event, context, callback);
    alexa.registerHandlers(handlers);
    alexa.execute();
};
