<template>
  <!-- メインコンテンツ -->
  <router-view />
  <p>
    {{ message }}
  </p>
</template>

<script>
export default {
  data() {
    return {
      message: "Hello Vue!"
    }
  },
  computed: {
    isTopPage() {
      return this.$route.path === "/"
    }
}
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: left;
}
</style>