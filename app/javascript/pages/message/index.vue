<template>
  <div>
    <p>メッセージページ</p>
  </div>
  <form @submit.prevent="createMessage">
  </form>
</template>

<script>
// import axios from '../../plugins/axios'
import axios from 'axios';

export default {
  name: "MessageIndex",
  methods: {
    createMessage: function() {
      axios
        .post('')
    }
  }
}
</script>

<style lang="scss" scoped>

</style>