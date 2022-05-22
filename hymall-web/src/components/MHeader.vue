<template>
  <div class="header">
    <v-app-bar
      class="d-flex align-center justify-center"
      app
      color="primary"
      dark
      elevate-on-scroll
    >
      <div class="d-flex align-center justify-center" style="width:1200px">
        <div class="d-flex align-center justify-center flex-grow-0">
          <v-img
            alt="Vuetify Logo"
            class="shrink mr-2"
            contain
            src="../assets/logo.png"
            transition="scale-transition"
            width="40"
          />
          <v-img
            alt="Vuetify Name"
            class="shrink mt-1 hidden-sm-and-down"
            contain
            min-width="40"
            src="../assets/logo.svg"
            width="190"
          />
        </div>
        <v-spacer></v-spacer>

        <v-toolbar-items class="d-flex justify-end align-center flex-grow-1">
          <div class="search-box">
            <input v-model.trim="goodName" class="search-txt" type="search" name placeholder="搜索" />
            <div class="search-btn">
              <v-icon @click="search" dark>mdi-magnify</v-icon>
            </div>
          </div>
          <router-link to="/">
            <v-btn text height="80px">首页</v-btn>
          </router-link>
          <router-link to="/about">
            <v-btn text height="80px">关于</v-btn>
          </router-link>
          <div v-if="!$store.getters.isLogin">
            <router-link tag="span" to="/login">
              <v-btn text height="80px">登录</v-btn>
            </router-link>

            <router-link tag="span" to="/register">
              <v-btn text height="80px">注册</v-btn>
            </router-link>
          </div>
          <div class="account" v-else>
            <router-link to="/profile">
              <v-btn text height="80px">
                <v-avatar class="mr-2" color="primary" size="42">
                  <v-icon v-if="!$store.state.avatar" dark>mdi-account-circle</v-icon>
                  <v-img v-else :src="$store.state.avatar"></v-img>
                </v-avatar>
                <span>{{$store.state.user.name}}</span>
              </v-btn>
            </router-link>
            <div class="account-items">
              <div class="d-flex flex-column">
                <v-btn color="#424242" @click="logout" class="pa-2 text-center" text>退出</v-btn>
              </div>
            </div>
          </div>
          <router-link to="/cart">
            <v-btn text height="80px">
              <el-badge :hidden="!$store.getters.cartNum" :value="$store.getters.cartNum">
                <v-icon>{{$store.getters.cartNum?'mdi-cart':'mdi-cart-outline'}}</v-icon>
              </el-badge>购物车
            </v-btn>
          </router-link>
        </v-toolbar-items>
      </div>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      goodName: '',
    };
  },
  methods: {
    search() {
      this.$emit('search', this.goodName);
      this.goodName = '';
    },
    logout() {
      this.$store.commit('logout');
      this.$router.push('/home');
    }
  },
};
</script>

<style lang="stylus" scoped>
.v-toolbar__content
  display block
  width 80%

.v-application a
  text-decoration none
  color #fff

.search-box
  margin-right 10px
  position relative
  background #9bd7ff
  height 40px
  border-radius 40px
  display flex
  align-items center
  justify-content flex-end

.search-box:hover
  padding-left 10px

.search-box:hover > .search-txt
  width 240px
  padding 0 6px

.search-box:hover > .search-btn
  background #d95cff
  border solid 1px rgba(184, 184, 184, 0.575)

.search-btn
  float right
  width 40px
  height 40px
  border-radius 50%
  background #72d3ff
  align-content flex-end
  display flex
  justify-content center
  align-items center
  transition 0.4s

.search-txt
  border none
  background none
  outline none
  float left
  padding 0
  color rgb(75, 75, 75)
  font-size 16px
  transition 0.4s
  line-height 40px
  width 0px

.header
  position absolute
  z-index 9
  min-width 1044px

.account
  position relative
  z-index 99

.account .account-items
  display none
  width 74px
  z-index 9999999
  position absolute
  background-color #b3e5fc
  top 68px
  right 10px
  border-radius 3px
  cursor pointer
  color #424242
  box-shadow 1px 1px 3px rgba(0, 0, 0, 0.2)

.account:hover .account-items
  display block
</style>