<template>
  <div>
    <MHeader @search="search" />
    <v-content class="flex-grow-1">
      <router-view></router-view>
    </v-content>
  </div>
</template>

<script>
import MHeader from '@/components/MHeader.vue';
export default {
  components: {
    MHeader,
  },
  methods: {
    search(goodName) {
      if (!goodName) return;
      this.$router.push(`/search/good/${goodName}`);
    }
  },
};
</script>
<style lang="stylus" scoped>
a
  text-decoration none
  color #fff
</style>

