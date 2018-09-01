import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Top from '@/components/Top'
import Kanjis from '@/components/Kanjis'
import Kanji from '@/components/Kanji'
import Event from '@/components/Event'
import EventEdit from '@/components/EventEdit'

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
      path: '/event/:url',
      name: 'Event',
      component: Event
    },
    {
      path: '/event_edit/:url',
      name: 'EventEdit',
      component: EventEdit
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