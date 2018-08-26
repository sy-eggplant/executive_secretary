<template>
<div id="app-5">
  <p>{{ msg }}</p>
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
  methods: {
    clear () {
    axios
      .get('http://localhost:3000/kanjis')
      .then(response => (this.msg = response))
      this.msg = ''
    }
  }
}
</script>
