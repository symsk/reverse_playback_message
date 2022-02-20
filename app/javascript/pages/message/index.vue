<template>
  <div>
    <p>メッセージページ</p>
  </div>
  <div>
  <form @submit.prevent="createMessage"
        :model="message"
        :action="message.action"
        method="post">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <input type="hidden" v-model="uuid" name="message[uuid]">
    </div>
    <div>
      <textarea v-model="message" name="message[message]"></textarea>
    </div>
    <button 
      type="submit"
      v-on:click="createMessage"
    >保存</button>
  </form>
  </div>
</template>

<script>
import axios from 'axios';
import { uuid } from 'vue-uuid'; 

export default {
  name: "MessageIndex",
  data () {
    return {
      uuid: uuid.v1(),
      message: '',
      errors: ''
    }
  },
  methods: {
    createMessage() {
      let uuidData = uuid.v1();
      this.$router.push(`/message/${uuidData}`)
      let formData = new FormData();
      formData.append('message', this.message);
      formData.append('uuid', uuidData);
      let config = {
        headers: {
          'content-type': 'multipart/form-data'
        }
      };
      axios
        .post("/api/messages", formData, config)
				.then(res => {
				this.message = "";
        console.log(res.data)
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
  }
}
</script>

<style lang="scss" scoped>

</style>