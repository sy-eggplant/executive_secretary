<template>
<div id="page">
<h2>幹事ページ</h2>
</div>
</template>
<script>
var Auth = {
  loggedIn: false,
  login: function() { this.loggedIn = true },
  logout: function() { this.loggedIn = false }  
};

var Login = {
  template: '<input type="submit" value="Login" v-on:click="login">',
  methods: {
    login: function() {
      Auth.login();
      router.push(this.$route.query.redirect);
    }
  }
};
</script>