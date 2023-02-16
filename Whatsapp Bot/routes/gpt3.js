const router = require("express").Router();
const { Configuration, OpenAIApi } = require("openai");
const configuration = new Configuration({
  apiKey: "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",
});

router.post("/disi", async (req,res)=>{

  // const dis = {dis:req.body.dis}
  const openai = new OpenAIApi(configuration)
  
  const completion = openai.createCompletion({
    model:'text-davinci-003',
    prompt:req.body.prompt,
    max_tokens: 1000
  })
  
  console.info('sending...')
  await completion.then((r) =>{
      console.info(r.data.choices[0].text)
      res.status(200).send(r.data.choices[0].text)
    })   
  

})




module.exports=router