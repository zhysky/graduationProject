<template>
  <v-app id="inspire">
    <v-content>
      <v-container class="fill-height" fluid>
        <v-row align="center" justify="center">
          <v-col cols="12" class="d-flex justify-center">
            <v-card>
              <v-toolbar color="primary" dark flat>
                <v-toolbar-title>登录</v-toolbar-title>
                <v-spacer />
              </v-toolbar>
              <v-card-text>
                <ValidationObserver ref="observer">
                  <v-form ref="form" lazy-validation>
                    <ValidationProvider v-slot="{ errors}" name="username" rules="required|min:3">
                      <v-text-field
                        label="用户名"
                        name="register"
                        validate-on-blur
                        prepend-icon="person"
                        type="text"
                        clearable
                        v-model="username"
                        required
                        :error-messages="errors"
                      />
                    </ValidationProvider>
                    <ValidationProvider
                      v-slot="{ errors}"
                      rules="required|min:4"
                      vid="confirmation"
                    >
                      <v-text-field
                        validate-on-blur
                        label="密码"
                        v-model="password"
                        name="password"
                        prepend-icon="lock"
                        clearable
                        :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                        :type="show1 ? 'text' : 'password'"
                        @click:append="show1 = !show1"
                        required
                        :error-messages="errors"
                      />
                    </ValidationProvider>
                  </v-form>
                </ValidationObserver>
              </v-card-text>
              <v-card-actions>
                <v-btn icon class="my-0" @click="resetForm">
                  <v-icon>mdi-refresh</v-icon>
                </v-btn>
                <v-spacer></v-spacer>

                <v-btn text small color="primary" to="/register">注册</v-btn>
                <v-spacer></v-spacer>

                <v-btn color="primary" @click="login">登录</v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-content>
  </v-app>
</template>
<script>
	import { login } from '../api/user';
  
	export default {
		name: 'Login',

		data() {
			return {
				show1:false,
				username: '',
				password: '',
			};
		},
		computed: {
			form () {
				return {
					username: this.username,
					password: this.password,
				};
			},
		},
		methods: {
			resetForm () {
				this.username = '';
				this.password = '';
				this.$refs.observer.reset();
			},
			async	login () {
				this.$refs.observer.handleSubmit(async () => {
					const res = await login(this.form);
					if (res.code) {
						this.$store.dispatch('login', res);
						await this.$router.push('/');
					} 
				}).then(r => r);
			},
		},
	};
</script>
<style scoped>
.v-card {
  width: 500px;
}
</style>
