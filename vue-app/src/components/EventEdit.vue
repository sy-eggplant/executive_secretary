<template>
  <div class="edit">
  <h1>幹事物語</h1>
  <span>title:</span>
    <input v-model="title" placeholder="edit me">
    <br>
  <span>{{ msg.id }}</span><br>
  <span>締め切り：</span>
    <el-date-picker v-model="datetime" type="datetime" placeholder="日時を選択してください"></el-date-picker>
    <br>
    <span>場所：</span>
    <input v-model="place" placeholder="edit me">
     <br>
     <span>memo：</span>
    <input v-model="memo" placeholder="edit me">
     <br>
     <span>total_fee：</span>
    <input v-model="total_fee" placeholder="edit me">
     <br>
    <span>募集中：</span>
    <input type="checkbox" id="checkbox_1" v-model="checked_1">
    <label for="checkbox_1">{{ checked_1 }}</label><br>
    <span>完了：</span>
    <input type="checkbox" id="checkbox_2" v-model="checked_2">
    <label for="checkbox_2">{{ checked_2 }}</label><br>
    <span>編集可能：</span>
    <input type="checkbox" id="checkbox_3" v-model="checked_3">
    <label for="checkbox_3">{{ checked_3 }}</label><br>
    <span>パスワード：</span>
    <input v-model="pass" placeholder="edit me">
     <br>
  <button @click="save()">save</button>
  <h2>日程追加</h2>
  <ul class="list-unstyled">
		<li v-for="t in test_dates" v-bind:key="t">
			<label>
				<span>{{t}}</span>
        <button @click="remove()">remove</button>

			</label>
		</li>
	</ul>
   <el-date-picker v-model="test_date" type="datetime" placeholder="日時を選択してください"></el-date-picker><br> 
  <button @click="add()">add</button>


  </div>
</template>
<script>
export default {
  name: 'Top',
  data () {
    return {
      pass: "",
      event_id: "",
      user_id: "",
      pass: "",
      title: "",
      datetime: "",
      place: "",
      memo: "",
      total_fee: "",
      checked_3: true,
      checked_2: true,
      checked_1: true,
      msg: 'aaa',
      id:"",
      test_date: "",
      test_dates: [

      ]
    }
  },
  mounted: function () {
    axios
      .get('http://localhost:3000/event_show/'+this.$route.params.url)
      .then(response => {
      this.msg = response.data
      this.title=this.msg.title
      this.pass=this.msg.pass
      this.place=this.msg.place
      this.memo=this.msg.memo
      this.datetime=this.msg.dead_line
      this.total_fee=this.msg.total_fee
      this.test_dates= ["2018-01-02","1000-01-01"

      ]
      })
     
    },
  methods: {
    save () {
      let params = new URLSearchParams();
      let params2 = new URLSearchParams();
      var title = this.title
      var pass = this.pass
      var msg = this.$data.msg
      var place = this.place
      var memo = this.memo
      var datetime = this.datetime
      var total_fee = this.total_fee
      var checked_1 = this.checked_1
      var checked_2 = this.checked_2
      var checked_3 = this.checked_3
      var test_dates = this.test_dates
      console.log(test_dates);

      params.append('event[title]', title);
      params.append('event[pass]', pass);
      params.append('event[place]', place);
      params.append('event[memo]', memo);
      params.append('event[total_fee]', total_fee);
      params.append('event[dead_line]', datetime);
      params.append('event[attend_flg]', checked_1);
      params.append('event[is_complete]', checked_2);
      params.append('event[is_edit]', checked_3)
      params2.append('candidate[day]', test_dates)
      params2.append('candidate[event_id]', msg.id)


      var u2 = 'http://localhost:3000/candidates'
      var u = 'http://localhost:3000/events/'+msg.id

      axios.post('http://localhost:3000/candidates', params2)
        .then(response => {
          var url = response.data.url
        }).catch(error => {
          console.log(error);
        });
      axios.patch(u, params)
        .then(response => {
          var url = response.data.url
          this.$router.push({ name: 'Event', params: { url }})
        }).catch(error => {
          console.log(error);
        });
    },
    add () {
      var newTodo = this.test_date;
			this.test_dates.push(
				newTodo
			);
      this.test_date = '';
      
    },
  }
}

</script>
