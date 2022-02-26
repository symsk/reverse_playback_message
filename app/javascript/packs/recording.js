window.onload = function () {
  let reload = document.getElementById("reload");
  let startButton = document.getElementById("start");
  let stopButton = document.getElementById("stop");
  let playButton = document.getElementById("btn");
  let reverseButton = document.getElementById("reverse_btn");
  let mediaRecorder;
  let localStream;
  const context = new AudioContext();
  let buffer = null;
  chunks = []

  reload.onclick = () => { 
    location.reload();
  }

  startButton.onclick = function () {
    navigator.mediaDevices.getUserMedia({ audio: true })
        .then(function (stream) {
            localStream = stream;
            mediaRecorder = new MediaRecorder(stream);
            mediaRecorder.start();
            console.log("Status: " + mediaRecorder.state);
        }).catch(function (err) {
            console.log(err);
        });
    }
    stopButton.onclick = function () {
        mediaRecorder.stop();
        console.log("Status: " + mediaRecorder.state);
        mediaRecorder.ondataavailable = function (event) {
            if (event.data.size > 0) {
              chunks.push(event.data);
            }
            const blob = new Blob(chunks)
            const reader = new FileReader()
            reader.readAsArrayBuffer(blob)
            reader.onload = function(event) {
              context.decodeAudioData(reader.result, (b) => buffer = b);
            }
            document.getElementById("audio").src = window.URL.createObjectURL(event.data);
        }
        localStream.getTracks().forEach(track => track.stop());
        startButton.disabled = true;
        stopButton.disabled = true;
    }

    let reverse = true;
    let reversed = false;
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

    playButton.onclick = function ()
    {
      let id = 'audio';
      // 初回の再生以外だったら音声ファイルの再生ポイントを先頭にしておく
      if( typeof( document.getElementById(id).currentTime ) != 'undefined' )
      {
        document.getElementById(id).currentTime = 0;
      }
      
      document.getElementById(id).play();
    }
}