<template>
  <div class="list-admin table-wrapper">
    <h2>
      <slot name="title">{{title}}</slot>
    </h2>
    <el-table :data="list" style="width: 100%">
      <el-table-column label="ID" width="400">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <slot name="default">
        <el-table-column label="父类" prop="parent.name" width="220"></el-table-column>
      </slot>
      <slot name="name">
        <el-table-column label="名称">
          <template slot-scope="scope">
            <span>{{ scope.row.name }}</span>
          </template>
        </el-table-column>
      </slot>
      <el-table-column label="操作" width="180">
        <template slot-scope="scope">
          <el-button @click="handleEdit(scope.row.id)" size="mini" v-if="edit">编辑</el-button>
          <el-button @click="handleDelete( scope.row.id)" size="mini" type="danger">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
        :current-page="currentPage"
        :page-size="pageSize"
        :page-sizes="[1, 2, 3, 4,5,10]"
        :total="count"
        @current-change="handleCurrentChange"
        @size-change="handleSizeChange"
        layout="total, sizes, prev, pager, next, jumper"
    ></el-pagination>
  </div>
</template>

<script>
  export default {
    name: 'MyList',
    props: {
      title: {
        type: String,
        'default': '列表标题',
      },
      list: Array,
      edit: {
        type: Boolean,
        'default': true,
      },
      count: {
        type: Number,
        'default': 0,
      },
      currentPage: {
        type: Number,
        'default': 1,
      },
      pageSize: {
        type: Number,
        'default': 5,
      },
    },
    methods: {
      handleEdit(id) {
        this.$emit('edit', id);
      },
      handleDelete(id) {
        this.$emit('remove', id);
      },
      handleSizeChange(val) {
        this.$emit('changeSize', val);
      },
      handleCurrentChange(val) {
        this.$emit('changeCurrent', val);
      },
    },
  };
</script>

<style scoped>
  ::v-deep .el-table__header-wrapper table.el-table__header thead.has-gutter tr th {
    color: rgb(255, 255, 255);
    background-color: rgba(85, 137, 233, 0.541);
  }

  .table-wrapper ::v-deep .el-table--fit {
    padding: 20px;
  }

  .table-wrapper ::v-deep .el-table,
  .el-table__header,
  .el-table__expanded-cell {
    background-color: rgba(255, 255, 255, 0.192);
  }

  .table-wrapper ::v-deep .el-table tr {
    background-color: rgba(255, 255, 255, 0.541) !important;
  }

  .el-pagination {
    margin-top: 20px;
  }
</style>