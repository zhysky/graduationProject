<template>
  <div class="login">
    <el-card header="请先登录" class="login-card">
      <el-form @submit.native.prevent="login">
        <el-form-item label="用户名">
          <el-input v-model="admin.name"></el-input>
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="admin.password" type="password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" native-type="submit">登录</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
	import { login } from '../http/admin';

	export default {
		name:'Login',
		data() {
			return {
				admin: {
					name:'',
					password:''
				}
			};
		},
		methods: {
			async login() {
				login(this.admin).then((res) => {
					localStorage.token=res.token;
					this.$store.commit('setToken', res.token);
					this.$router.push('/');
					this.$message({
						type: 'success',
						message:res.message 
					});
				}).catch(err =>err);
			}
		},
	};
</script>

<style scoped>
.login-card {
  width: 30rem;
  margin: 15rem auto;
}
</style>
