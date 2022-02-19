<template>
  <div>
    <p>メッセージページ</p>
  </div>
  <form @submit.prevent="createMessage">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <textarea v-model="message.message"></textarea>
    </div>
    <button 
      type="submit"
      v-on:click="uniqueMessage"
    >Commit</button>
  </form>
</template>

<script>
// import axios from '../../plugins/axios'
import axios from 'axios';
import { uuid } from 'vue-uuid'; 

export default {
  name: "MessageIndex",
  data () {
    return {
      uuid: uuid.v1(),
      message: {
        message: '',
      },
      errors: ''
    }
  },
  methods: {
    uniqueMessage() {
      this.$router.push(`/api/message/${uuid.v1()}`)
    },
    // createMessage: function() {
    //   axios
    //     .post(`/api/message/${uuid}`, this.message)
    //     // .post(`/api/message/${this.uuid}`, this.message)
    //     this.$router.push('/api/message/')
    //     .then(response => {
    //       let e = response.data;
    //       this.$router.push({ message: '', params: { id: e.id } });
    //     })
    //     .catch(error => {
    //       console.error(error);
    //       if (error.response.data && error.response.data.errors) {
    //         this.errors = error.response.data.errors;
    //       }
    //     });
    // }
  }
}
</script>

<style lang="scss" scoped>

</style>