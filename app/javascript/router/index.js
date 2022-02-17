import { createRouter, createWebHistory } from 'vue-router'

import TopIndex from "../pages/top/index.vue"
import MessageIndex from "../pages/message/index.vue"

const routes = [
  {
    path: '/',
    name: 'TopIndex',
    component: TopIndex,
  },
  {
    path: '/Message',
    name: 'MessageIndex',
    component: MessageIndex,
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router