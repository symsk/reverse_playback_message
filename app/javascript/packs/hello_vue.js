import { createApp } from 'vue'
import App from "../app.vue";
import Router from '../router/index.js'

document.addEventListener('DOMContentLoaded', () => {
  createApp(App).use(Router).mount("#vue-app");
});
