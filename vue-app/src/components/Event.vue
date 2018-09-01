<template>
<div id="app-5">
  <span>title:</span>
  <span>{{ msg.title }}</span><br>
  <span>締め切り：</span>
  <span>{{ msg.dead_line }}</span>
    <br>
    <span>募集中：</span>
  <span>{{ msg.attend_flg }}</span><br>
    <span>完了：</span>
   <span>{{ msg.title }}</span><br>
    <span>編集可能：</span>
  <span>{{ msg.title }}</span><br>
    <span>パスワード：</span>
  <span>{{ msg.pass }}</span>
     <br>
  <button @click="edit()">edit</button>
  <button @click="event_delete()">delete</button>
</div>
</template>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
import axios from 'axios'
import Vue from 'vue';
export default {
  data () {
    return {
      msg: 'Hello World!'
    }
  },
  mounted: function () {
    axios
      .get('http://localhost:3000/event_show/'+this.$route.params.url)
      .then(response => (this.msg = response.data))
      console.log(this.$route.params.url);
    },
  methods: {
    edit () {
        var url = this.$route.params.url
        this.$router.push({ name: 'EventEdit', params: { url }})
    },
    event_delete () {
        var url = this.$route.params.url
        this.$router.push({ name: 'EventEdit', params: { url }})
    }
  }
}
</script>
