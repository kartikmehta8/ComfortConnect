// Fetch all saved messages
const messages = {
    // Get welcome message
    getWelcomeMessage: () => {
        return "Welcome to Morale Booster! How can I help you today. You can share your concerns with me.";
    },

    // Get help message
    getHelpMessage: () => {
        return "You can say - I had a fight with a friend, or I am not able to sleep, etc.";
    },

    // Get again message
    getAgainMessage: () => {
        return "Go ahead.";
    },

    // Get stop message
    getStopMessage: () => {
        return "Goodbye!";
    },

    // Get cancel message
    getCancelMessage: () => {
        return "Oops! I got interrupted.";
    },
};

module.exports = messages;
