<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
	export default {
		name: 'app',
	};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
img {
  object-fit: cover;
  vertical-align: middle;
}
.cover-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.cover-uploader .el-upload:hover {
  border-color: #409eff;
}

.cover {
  height: 300px;
  display: block;
}
</style>
