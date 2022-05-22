<template>
  <v-footer color="primary lighten-1" padless>
    <!-- <v-col class="info lighten-2 text-center white--text" cols="12">
      <router-link
        to="/"
        v-for="link in links"
        :key="link"
        color="white"
        text
        rounded
        class="my-2"
        px-4
      >{{ link }}</router-link>
    </v-col> -->
    <v-col class="info lighten-0 text-center white--text" cols="12">
      {{ new Date().getFullYear() }} —
      <strong>ZHY</strong>
    </v-col>
  </v-footer>
</template>

<script>
export default {
  data: () => ({
    links: [
      '首页',
      '关于',
      '服务',
      '联系我们',
    ],
  }),
};
</script>

<style lang="stylus" scoped>
.v-application a
  margin 10px
  text-decoration none
  color #fff

.v-footer
  width 100vw
  position sticky
  top calc(100vh - 64px)
</style>