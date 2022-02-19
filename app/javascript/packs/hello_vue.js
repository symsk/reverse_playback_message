import { createApp } from 'vue'
import App from "../app.vue"
import Router from '../router/index.js'
import withUUID from 'vue-uuid'

document.addEventListener('DOMContentLoaded', () => {
  const app = withUUID(createApp(App).use(Router))
  app.mount("#vue-app")
});
