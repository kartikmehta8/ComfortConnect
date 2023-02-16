const feelingData = {
    // Get person slot speak out questions
    getEmotionSpeakout: () => {
        return [
            "What happened to you dear?",
            "What are you feeling?",
            "Please tell what are you feeling?",
        ];
    },

    // Get reason slot speak out questions
    getCauseSpeakout: () => {
        return [""];
    },

    // Get sample dataset
    getDataset: () => {
        return [
            {
                emotion: "lonely",
                suggestion: [
                    "You should start joining social events.",
                    "Why don't you hang out with friends",
                    "Call you relatives or friends",
                ],
            },
            {
                emotion: "stress",
                suggestion: [
                    "Avoid caffeine, alcohol, nicotine",
                    "Listen to some music.",
                    "Go out for movies.",
                ],
            },
            {
                emotion: "anxious",
                suggestion: [
                    "Find what relaxes you.",
                    "Don't worry about things you have no control over.",
                    "Involve in meditation or other similar activities like yoga.",
                ],
            },
            {
                emotion: "angry",
                suggestion: [
                    "Think before you speak so that you don't repent later",
                    "Get some exercise",
                    "Take a time out",
                ],
            },
            {
                emotion: "sad",
                suggestion: [
                    "Cry if you need to.",
                    "Shower or bathe in warm water",
                    "Listen to music",
                ],
            },
            {
                emotion: "bore",
                suggestion: [
                    "Get involve in some creative work",
                    "Go a walk",
                    "Interact with others",
                ],
            },
        ];
    },
};

module.exports = feelingData;
