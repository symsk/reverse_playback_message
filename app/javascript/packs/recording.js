let reload = document.getElementById("reload");
let playback = document.getElementById("audio");
let startRecording = document.getElementById("start");
let stopRecording = document.getElementById("stop");
let playButton = document.getElementById("btn");
let reverseButton = document.getElementById("reverse_btn");
let answerButton = document.getElementById("answer_btn");
let answer = document.getElementById("answer");
const context = new AudioContext();
let mediaRecorder;
let localStream;
let buffer = null;
let reverse = true;
let reversed = false;
chunks = []

reload.onclick = () => { 
  location.reload();
}

startRecording.onclick = () => {
  navigator.mediaDevices.getUserMedia({ audio: true })
    .then((stream) => {
      localStream = stream;
      mediaRecorder = new MediaRecorder(stream);
      mediaRecorder.start()
    });
      startRecording.disabled = true;
      startRecording.textContent = "録音中...";
}

stopRecording.onclick = () => {
  mediaRecorder.stop();
  mediaRecorder.ondataavailable = (event) => {
    if (event.data.size > 0) {
      chunks.push(event.data);
    }
    let blob = new Blob(chunks)
    let reader = new FileReader()
    reader.readAsArrayBuffer(blob)
    reader.onload = () => {
      context.decodeAudioData(reader.result, (b) => buffer = b);
    }
    playback.src = window.URL.createObjectURL(event.data);
  }
  stopRecording.disabled = true;
  startRecording.textContent = "録音開始";
}

playButton.onclick = () => {
  playback.play();
}

reverseButton.onclick = () => {
  if (reverse !== reversed) {
    buffer.getChannelData(0).reverse();
    reversed = !reversed;
  }
  const source = context.createBufferSource();
  source.buffer = buffer;
  source.playbackRate.value = ((r) => 0 < r ? r : 1)(parseFloat(document.getElementById("rate").value));
  source.connect(context.destination);
  source.onended = () => source.stop(0);
  source.start(0);
}
