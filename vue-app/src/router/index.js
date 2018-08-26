import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Top from '@/components/Top'
import Kanjis from '@/components/Kanjis'
import Kanji from '@/components/Kanji'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/top',
      name: 'Top',
      component: Top
    },
    {
      path: '/hello',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/kanjis',
      name: 'Kanjis',
      component: Kanjis
    },
    {       
      path: '/kanji/:name',
      name: 'Kanji',
      components: {
        Kanji
      },
      meta: { requiresAuth: true }
    },
  ]
})