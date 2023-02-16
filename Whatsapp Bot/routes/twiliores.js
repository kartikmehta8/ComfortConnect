const router=require('express').Router()
const bodyParser = require('body-parser');
const twilio=require('twilio')

const accountSid = 'AC42adc57b1e7641bfa5209041f877ce96';
const authToken = '5a01b9256cb009d4c222b0893786159f';
const client = new twilio(accountSid, authToken);


const { Configuration, OpenAIApi } = require("openai");
const configuration = new Configuration({
  apiKey: "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",
});


router.post('/incoing',async (req, res) => {
  const message = req.body.Body;
  console.log(`${message} in short`);

  const openai = new OpenAIApi(configuration)
  
  const completion = openai.createCompletion({
    model:'text-davinci-003',
    prompt:message,
    max_tokens: 1000
  })
  console.info('sending...')
  await completion.then((r) =>{
      console.info(r.data.choices[0].text)
      res.send(`<Response><Message> ${r.data.choices[0].text}</Message></Response>`);
    })   
  
});
// app.get("hel",(req,res)=>{
//     const message = req.body.Body;
//     console.log(`Received message: ${message}`);
    

// })

module.exports=router