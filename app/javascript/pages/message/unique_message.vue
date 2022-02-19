<template>
  <div>
    <p>{{ message.reverse_message }}</p>
  </div>
</template>

<script>
// import axios from '../../plugins/axios'
import axios from 'axios';

export default {
  name: "UniqueMessage",
  data: function () {
    return {
      messages: []
    }
  },
  mounted () {
    axios
      .get('/api/messages.json')
      .then(response => (this.messages = response.data))
  }
}
</script>

<style lang="scss" scoped>

</style>