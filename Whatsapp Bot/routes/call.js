const router=require('express').Router()
const app = express();
const accountSid = 'AC42adc57b1e7641bfa5209041f877ce96';
const authToken = '5a01b9256cb009d4c222b0893786159f';
const client = require('twilio')(accountSid, authToken);

router.get('/call', (req, res) => {
  client.calls
    .create({
      twiml: '<Response><Say>Welcome to comfort connect you can reach us on our website, download our application, or connect with us on our Alexa skills "Family Journal" and "Mood Tracker".</Say></Response>',
      to: '+916307515341',
      from: '+17252093975'
    })
    .then(call => console.log(call.sid));
  res.send('Call initiated successfully');
});

module.exports=router