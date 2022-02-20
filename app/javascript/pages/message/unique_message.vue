<template>
  <div>
    <ul>
      <li v-for="message in messages">{{ message.reverse_message }}</li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'UniqueMessage',
  data() {
    return {
      messages: []
    }
  },
  mounted() {
    axios
      .get('/api/messages')
      .then(response => (this.messages = response.data))
      .catch(err => console.log(err.status))
  },
}
</script>

<style lang="scss" scoped>

</style>