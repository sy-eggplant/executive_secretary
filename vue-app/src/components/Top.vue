<template>
  <div>
  <h1>幹事物語</h1>
  <h2>幹事になる</h2>
    <span>名前：</span>
    <input v-model="kanji_name" placeholder="edit me">
    <span>password：</span>
    <input v-model="pass" placeholder="edit me">
    <button @click="create_kanji()">create_kanji</button>
  <h2>スケジュール調整作成</h2>
    <span>タイトル：</span>
    <input v-model="title" placeholder="edit me">
    <button @click="create_event()">create_event</button>
  <h2>参加する</h2>
      <span>イベントID：</span>
      <input type="text" v-model="event_id">
      <button @click="attend_event()">attend_event</button>
  <h2>Sign in</h2>
  <span>user_id：</span>
  <input type="text" v-model="user_id">
  <span>password：</span>
  <input type="text" v-model="password">
  <button @click="sign_in()">sign_in</button>
  </div>
</template>
<script>
export default {
  name: 'Top',
  data () {
    return {
      kanji_name: "",
      pass: "",
      event_id: "",
      user_id: "",
      password: "",
      title: "",
    }
  },
  methods: {
    create_kanji () {
      let params = new URLSearchParams();
      var name = this.kanji_name
      var pass = this.pass
      params.append('kanji[name]', name);
      params.append('kanji[pass]', pass);
      axios.post('http://localhost:3000/kanjis', params)
        .then(response => {
          console.log('送信したテキスト: ' + response.data.id);
          var id = response.data.id
          this.$router.push({ name: 'Kanji', params: { id }})
        }).catch(error => {
          console.log(error);
        });
    },
    create_event () {
      let params = new URLSearchParams();
      var title = this.title
      params.append('event[title]', title);
      axios.post('http://localhost:3000/events', params)
        .then(response => {
          console.log('送信したテキスト: ' + response.data.url);
          var url = response.data.url
          this.$router.push({ name: 'Event', params: { url }})
        }).catch(error => {
          console.log(error);
        });
    },
    attend_event () {
     
    },
    sing_in () {
     
    }
  }
}

</script>
