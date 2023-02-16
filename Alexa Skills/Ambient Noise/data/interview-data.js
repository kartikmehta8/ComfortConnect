const interviewData = {
    // Get person slot speak out questions
    getCompanySpeakout: () => {
        return ["Which company you applied to?"];
    },

    // Get reason slot speak out questions
    getWhenSpeakout: () => {
        return ["When were you interviewed?", "When was the interview?"];
    },

    // Get sample dataset
    getDataset: (company, when) => {
        return [
            `Never lose focus. Keep applying to other companies and reapply to the same company again in future`,
        ];
    },
};

module.exports = interviewData;
