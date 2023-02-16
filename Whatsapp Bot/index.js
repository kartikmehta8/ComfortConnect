const express = require('express');
const gpt=require('./routes/gpt3')
const twi=require('./routes/twiliores')
const app = express();
const call=require('./routes/call')

app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json())

app.use('/gpt',gpt)
app.use("/msg",twi)
app.use('/twilcall',call)

const PORT = process.env.PORT||3000


app.listen(PORT, () => {
  console.log('WhatsApp bot listening on port 3000!');
});
