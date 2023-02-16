const schizophreniaBtn = document.getElementById('detect-schizophrenia');
const groupTherapyBtn = document.getElementById('group-therapy');
const locationTrackingBtn = document.getElementById('location-tracking')
const multilingualBtn = document.getElementById('multilingual');
// const visualizationBtn = document.getElementById('visualization');
const passwordlessAuthenticationBtn = document.getElementById('passwordless-authentication');
const voiceEnabledBtn = document.getElementById('voice-enabled');
const artTherapyBtn = document.getElementById('art-therapy');
const loginButton = document.querySelector('.register-btn');
const getStarted = document.querySelector('.content button');
const featureDiv = document.querySelector('.feature-container');
const detectionDiv = document.getElementById('detect-schizophrenia-container');
const detect = document.querySelector('.detect');
const modalBody = document.querySelector('.modal-body');
// detect.addEventListener("click", showPred);


getStarted.addEventListener("click", () => {
    featureDiv.scrollIntoView({behavior:"smooth"});
})
loginButton.addEventListener("click", authentication);

function authentication(){
    window.location.href = "./Authentication/signIn.html";
}

function loginKrkeAA(){
    // let verificationToken = localStorage.getItem("Verification");
    // if(verificationToken){
        return;
    // }
    // window.location.href = './Authentication/signIn.html'
}
function init(){
    // let verificationToken = localStorage.getItem("Verification");
    schizophreniaBtn.onclick = loginKrkeAA;
    groupTherapyBtn.onclick = loginKrkeAA;
    locationTrackingBtn.onclick = loginKrkeAA;
    multilingualBtn.onclick = loginKrkeAA;
    voiceEnabledBtn.onclick = loginKrkeAA;
    passwordlessAuthenticationBtn.onclick = loginKrkeAA;
    artTherapyBtn.onclick = loginKrkeAA;
    if(!verificationToken){
        detectionDiv.style.display = "none";
        

        return;
    }
    loginButton.style.display = "none";
}

init();

// for twitter
async function getVal() {
    const val = document.getElementById('twitter-username').value;
    console.log(val);
    try{
        let res = await axios.get(`https://twitter-mh-detection.herokuapp.com/predict/${val}`);
        console.log(res.data);
        detect.disabled = false;
        if(res.data.Normal == "yes" && res.data.Schizophrenia == "no" && res.data.Suicidal == "no"){
            modalBody.innerHTML = "Hey, we didn't find any traces of Schizophrenia, Anxiety or Depression, just stay hydrated, you're fine as a fresh mint."
        } else {
            modalBody.innerHTML = `Hi friend, we think you might have following, 
            ${res.data.Schizophrenia == "yes"? "Schizophrenia" : ""},
            ${res.data.Suicidal == "yes" ? "Suicidal Thoughts" : ""},
            ${res.data.Anxiety == "yes" ? "Anxiety" : ""},
            ${res.data.Depression == "yes" ? "Depression" : ""},
            Totally recommended to get yourself checked from a doctor ASAP` 
        }
        
    }
    catch(err){
        getVal();
    }
    
  }
  function getUserVal(){
    const userVal = document.getElementById('username-to-be-analyzed').value;
    return userVal;
  }
  async function getPredfromText(paragraph){
      try{
        let textres = await axios.get(`https://mh-detection-api.herokuapp.com/predict/${paragraph}`);
        console.log(textres.data);
        detect.disabled = false;
        if(textres.data.Normal == "yes" && textres.data.Schizophrenia == "no" && textres.data.Suicidal == "no"){
            modalBody.innerHTML = "Hey, we didn't find any traces of Schizophrenia, Anxiety or Depression, just stay hydrated, you're fine as a fresh mint."
        } else {
            modalBody.innerHTML = `Hi friend, we think you might have following: <br> 
            ${textres.data.Schizophrenia == "yes"? "Schizophrenia <br>" : ""}
            ${textres.data.Suicidal == "yes" ? "Suicidal Thoughts <br>" : ""}
            ${textres.data.Anxiety == "yes" ? "Anxiety <br>" : ""}
            ${textres.data.Depression == "yes" ? "Depression <br>" : ""}
            Totally recommended to get yourself checked from a doctor ASAP`
        }
      }
      catch(err){
          console.log("meko zeher dedo bisi")
          getPredfromText(paragraph);
          
      }
    
  }
  
  document.getElementById('input-file')
    .addEventListener('change', getFile)
  
  function getFile(event) {
      const input = event.target
    if ('files' in input && input.files.length > 0) {
        placeFileContent(
        document.getElementById('content-target'),
        input.files[0])
    }
  }
  
  async function placeFileContent(target, file) {
      readFileContent(file).then(content => {
        target.value = content
       console.log(target.value);
      text = target.value;
      let arr = text.split('\n');
      // console.log(arr);
  
      for(let i=0; i<arr.length; i++){
          arr[i] = arr[i].substring(23).trim();  // 23 constant rhega timestamp k characters are constant
      }
      // console.log(arr);
      let temp = [];
      let val = getUserVal();
      for(let j=0; j<arr.length; j++){
          if(arr[j].includes(val)){
              temp.push(arr[j]);
          }
      }
      arr = temp;
      for(let i=0; i<arr.length; i++){
          arr[i] = arr[i].split(':')[1]; //user jo bhi input kre uski length se update kro!
      }
      // console.log(arr);
      
      const paragraph = arr.join('.');
      console.log(paragraph);
      // https://mh-detection-api.herokuapp.com/predict/
      // API call.
      getPredfromText(paragraph)
    }).catch(error => console.log(error))
  }
  
  function readFileContent(file) {
      const reader = new FileReader()
    return new Promise((resolve, reject) => {
      reader.onload = event => resolve(event.target.result)
      reader.onerror = error => reject(error)
      reader.readAsText(file)
    })
  }
  
  schizophreniaBtn.onclick = function(){
    // let verificationToken = localStorage.getItem("Verification");
    // if(verificationToken){
        detectionDiv.scrollIntoView({behavior: "smooth"});
      return;
    // }
    // window.location.href = './Authentication/signIn.html'
  }

groupTherapyBtn.onclick = function(){
    // let verificationToken = localStorage.getItem("Verification");
    // if(verificationToken){
        window.location.href = 'https://ckutce4t8102524idk0qz4z0hz3-e6s4hkw8z-pooja-gera.vercel.app/create'
      return;
    // }
    // window.location.href = './Authentication/signIn.html'
    
}
locationTrackingBtn.onclick = function(){
    // let verificationToken = localStorage.getItem("Verification");
    //  if(verificationToken){
        window.location.href = './Location/location.html'
        return
  // }
  // window.location.href = './Authentication/signIn.html'
    
};



passwordlessAuthenticationBtn.onclick = function(){
    // let verificationToken = localStorage.getItem("Verification");
    //  if(verificationToken){
        window.location.href = './Authentication/signIn.html'
        return
  // }
  // window.location.href = './Authentication/signIn.html'
    
};

artTherapyBtn.onclick = function(){
    // let verificationToken = localStorage.getItem("Verification");
    //  if(verificationToken){
        window.location.href='./Board/OpenBoard/activity/index.html'
        return
  // }
  // window.location.href = './Authentication/signIn.html'
    
}



