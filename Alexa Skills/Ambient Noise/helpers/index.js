const fightData = require("../data/fight-data");
const interviewData = require("../data/interview-data");
const feelingData = require("../data/feeling-data");

const helperFn = {
    // Get any random value in the passed array
    getRandomValue: (array) => {
        return array[Math.floor(Math.random() * array.length)];
    },

    // Get fight suggestions
    getFightSuggestion: (person, reason) => {
        const data = fightData.getDataset();

        for (var i = 0; i < data.length; i++) {
            var dataObj = data[i];
            if (
                dataObj.person == person &&
                reason.indexOf(dataObj.reason) > -1
            ) {
                return helperFn.getRandomValue(dataObj.suggestion);
            }
        }

        return "Sorry, this is beyond my scope. Consult a professional";
    },

    // Get interview suggestions
    getInterviewReplies: (company, when) => {
        return interviewData.getDataset();
    },

    //
    getFeelingSuggestion: (emotion) => {
        const data = feelingData.getDataset();

        for (var i = 0; i < data.length; i++) {
            var dataObj = data[i];
            if (
                emotion.indexOf(dataObj.emotion) >
                -1 /* && cause.indexOf(dataObj.cause) > -1 */
            ) {
                return helperFn.getRandomValue(dataObj.suggestion);
            }
        }

        return "Sorry, this was quite intense. Take a deep breathe and relax.";
    },
};

module.exports = helperFn;
