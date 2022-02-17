<template>
<v-col cols="4">
  <div>
    <button class="button" @click="startListening">ボタン</button>
    <div class="button" @click="startListening">ボタン</div>
  </div>
  <div>
    <v-btn
      :to="{ name: 'MessageIndex' }"
    >
    メッセージページへ
    </v-btn>

    <router-link :to="{ name: 'MessageIndex'}">
      メッセージページへ
    </router-link>
  </div>
  </v-col>
</template>

<script>
// import axios from '../../plugins/axios'

export default {
  name: "TopIndex",
  data() {
    return {
      isRunning: false,
      isJudged: false, //必要性を後でチェック
      stream: null,
      recorder: null,
      audioData: [], 
    }
  },
  methods: {
    click(message) {
      alert(message);
    },
    click() {
      this('click');
    },
    // 録音を開始・ストップする部分
    startListening() {
      navigator.mediaDevices
        .getUserMedia({ audio: true })
        .then(stream => {
          this.isRunning = true;
          this.stream = stream
          // 録音APIの準備(MediaStream Recording API)
          this.recorder = new MediaRecorder(stream);
        }).catch(error => {
          console.error('mediaDevices.getUserMedia() error:', error)
        })
    },
  },
  // mounted() {
  //   // マイクにアクセス
  // }
}
</script>

<style lang="scss" scoped>

</style>