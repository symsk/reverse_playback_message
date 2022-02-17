import { createRouter, createWebHistory } from 'vue-router'

import TopIndex from "../pages/top/index.vue"

const routes = [
  {
    path: '/',
    name: 'TopIndex',
    component: TopIndex,
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router