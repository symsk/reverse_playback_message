let reload = document.getElementById("reload");
let startRecording = document.getElementById("start");
let stopRecording = document.getElementById("stop");
let playButton = document.getElementById("btn");
let reverseButton = document.getElementById("reverse_btn");
let answerButton = document.getElementById("answer_btn");
let answer = document.getElementById("answer");
let spinner = document.getElementById("spinner");
const context = new AudioContext();
let mediaRecorder;
let localStream;
let buffer = null;
let reverse = true;
let reversed = false;
chunks = []

reload.onclick = () => { 
  location.reload(true);
}

startRecording.onclick = () => {
  navigator.mediaDevices.getUserMedia({ audio: true })
      .then((stream) => {
          localStream = stream;
          mediaRecorder = new MediaRecorder(stream);
          mediaRecorder.start();
          console.log("Status: " + mediaRecorder.state);
      }).catch((err) => {
          console.log(err);
      });
      startRecording.disabled = true;
      startRecording.textContent = "録音中...";
}

stopRecording.onclick = () => {
    mediaRecorder.stop();
    console.log("Status: " + mediaRecorder.state);
    mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          chunks.push(event.data);
        }
        const blob = new Blob(chunks)
        const reader = new FileReader()
        reader.readAsArrayBuffer(blob)
        reader.onload = () => {
          context.decodeAudioData(reader.result, (b) => buffer = b);
        }
        document.getElementById("audio").src = window.URL.createObjectURL(event.data);
    }
    localStream.getTracks().forEach(track => track.stop());
    stopRecording.disabled = true;
    startRecording.textContent = "録音開始";
}

playButton.onclick = () => {
  let id = 'audio';
  if( typeof( document.getElementById(id).currentTime ) != 'undefined' )
  {
    document.getElementById(id).currentTime = 0;
  }
  document.getElementById(id).play();
}

reverseButton.onclick = () => {
    if (reverse !== reversed) {
      buffer.getChannelData(0).reverse();
      reversed = !reversed;
    }
    const source = context.createBufferSource();
    source.buffer = buffer;
    source.playbackRate.value = ((r) => 0 < r ? r : 1)(parseFloat(document.getElementById('rate').value));
    source.connect(context.destination);
    source.onended = () => source.stop(0);
    source.start(0);
}

answerButton.onclick = () => {
  if(getComputedStyle(answer).visibility == "hidden"){
    answer.style.visibility = "visible";
  } else {
    answer.style.visibility = "hidden";
  }
}
