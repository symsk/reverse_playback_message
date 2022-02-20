import { createRouter, createWebHistory } from 'vue-router'

import TopIndex from "../pages/top/index.vue"
import MessageIndex from "../pages/message/index.vue"
import UniqueMessage from "../pages/message/unique_message.vue"
import QuizIndex from "../pages/quiz/index.vue"

const routes = [
  {
    path: '/',
    name: 'TopIndex',
    component: TopIndex,
  },
  {
    path: '/message',
    name: 'MessageIndex',
    component: MessageIndex,
  },
  {
    path: '/message/:uuid',
    name: 'UniqueMessage',
    component: UniqueMessage,
  },
  {
    path: '/quiz',
    name: 'QuizIndex',
    component: QuizIndex,
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router