<template>
  <v-app>
    <router-view></router-view>
  </v-app>
</template>  

<script>
export default {
  name: 'App',
};
</script>
<style lang="stylus">
*
  margin 0
  padding 0

a
  text-decoration none
  color #fff

img
  object-fit cover
  vertical-align middle

.avatar-uploader .el-upload
  border 1px dashed #d9d9d9
  border-radius 6px
  cursor pointer
  position relative
  overflow hidden

.avatar-uploader .el-upload:hover
  border-color #409eff

.avatar-uploader-icon
  font-size 28px
  color #8c939d
  width 150px
  height 150px
  line-height 150px !important
  text-align center

.avatar
  width 178px
  height 178px
  display block

summary
  outline none
</style>
