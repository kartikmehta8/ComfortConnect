const fightData = {
    // Get person slot speak out questions
    getPersonSpeakout: () => {
        return [
            "With whom you had the fight?",
            "You had the fight with whom?",
            "Please tell with whom did you fight with?",
            "You fought with whom?",
            "Please tell me with whom you fought?",
        ];
    },

    // Get reason slot speak out questions
    getReasonSpeakout: () => {
        return [
            "Why did you fight",
            "Please tell what prompted you to fight",
            "What was the reason behind your fight",
            "Please tell me what was the reason behind your fight?",
        ];
    },

    // Get sample dataset
    getDataset: () => {
        return [
            {
                person: "father",
                reason: "misunderstanding",
                suggestion: [
                    "Having a fight with you father sounds rare, that's why it impacted you. Generally, fathers have valid points and logics. So give it a thought",
                    "Misunderstandings arrise due to difference in opinions. By sharing in activities or simply spending time together, fathers and children can learn to overcome their differences. Give it a shot.",
                ],
            },
            {
                person: "father",
                reason: "insult",
                suggestion: [
                    "Feeling of insult arrises mainly in teenagers that's the stage during which a young adult is attempting to form their own identity.",
                ],
            },
            {
                person: "mother",
                reason: "disrespect",
                suggestion: [
                    "",
                    "It's very much normal to have a fight with your mother. Don't lose heart, she is going to be the first one to wake you up with a warm smile.",
                ],
            },
            {
                person: "friend",
                reason: "offend",
                suggestion: [
                    "You should take a break of each other",
                    "Do not worry, if it's a true friendship, this feeling of negativity will wipe away even before it sinks in.",
                ],
            },
            {
                person: "partner",
                reason: "misunderstanding",
                suggestion: [
                    "Having a fight with your partner is a sign of healthy relationship. So, don't let that smile fade.",
                ],
            },
        ];
    },
};

module.exports = fightData;
