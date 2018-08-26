<template>
<div id="app-5">
    <span>title:</span>
  <span>{{ msg.title }}</span>
  <button @click="clear()">clear</button>
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
    }
}
</script>
