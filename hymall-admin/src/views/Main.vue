<template>
  <div>
    <el-container style="height: 100vh;">
      <el-header>
       <div class="header">
          <div style="color:grey;">商城后台管理系统</div>
          <div><el-button type="text" @click="lognOut">退出</el-button>
          </div>
       </div>
      </el-header>
      <el-container height="100%">
        <el-aside>
          <el-menu
            router
            default-active="1"
            :default-openeds="openeds"
            background-color="#293663"
            text-color="#fff"
            active-text-color="#ffd04b"
            style="height: 100%;"
          >
            <el-submenu index="1">
              <template slot="title">
                <i class="el-icon-collection-tag"></i>
                <span>分类</span>
              </template>
              <el-menu-item index="/category/create">添加分类</el-menu-item>
              <el-menu-item index="/category/list">分类列表</el-menu-item>
            </el-submenu>
            <el-submenu index="2">
              <template slot="title">
                <i class="el-icon-s-shop"></i>
                <span>商品</span>
              </template>
              <el-menu-item index="/good/create">添加商品</el-menu-item>
              <el-menu-item index="/good/list">商品列表</el-menu-item>
            </el-submenu>
            <el-submenu index="3">
              <template slot="title">
                <i class="el-icon-s-shop"></i>
                <span>轮播图</span>
              </template>
              <el-menu-item index="/carousel/create">添加轮播图</el-menu-item>
              <el-menu-item index="/carousel/list">轮播图列表</el-menu-item>
            </el-submenu>
          </el-menu>
        </el-aside>
        <el-main>
          <router-view />
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
	export default {
		name: 'Main',
		data() {
			return {
				openeds: ['2']
			};
		},
		methods: {
			lognOut(){
				localStorage.token='';
				this.$store.commit('setToken', '');
				this.$router.push('/login');
			}
		}
	};
</script>

<style scoped>
.el-header,
.el-footer {
  background-color: #1b3f63;
  color: #333;
  line-height: 60px;
}
.header{
  display: flex;
  justify-content: space-between;
}

.el-aside {
  color: #333;
  line-height: 200px;
}

.el-main {
  background-color: rgb(171, 190, 202);
  color: #333;
}

.el-aside {
  line-height: 260px;
}

.el-container:nth-child(7) .el-aside {
  line-height: 320px;
}
.el-menu {
  border-right: none;
}
</style>