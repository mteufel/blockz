<script setup>
import MapTile from "./components/MapTile.vue";
</script>


<template>

  <div class="levelmap">
    <MapTile v-for="t in levelMap" :tile="t.tile" />
  </div>

  <br><br>
  <MapTile :tile="byId(1).tile" :selected="byId(1).selected" /><MapTile :tile="byId(2).tile" :selected="byId(2).selected"/><MapTile :tile="byId(3).tile" :selected="byId(3).selected"/><MapTile :tile="byId(4).tile" :selected="byId(4).selected" />
  <MapTile :tile="byId(5).tile" :selected="byId(5).selected" /><MapTile :tile="byId(6).tile" :selected="byId(6).selected" /><MapTile :tile="byId(7).tile" :selected="byId(7).selected" />
  <MapTile :tile="byId(8).tile" :selected="byId(8).selected"/><MapTile :tile="byId(9).tile" :selected="byId(9).selected"/><MapTile :tile="byId(10).tile" :selected="byId(10).selected" /><MapTile :tile="byId(11).tile" :selected="byId(11).selected"/><br>
  <MapTile :tile="byId(12).tile" :selected="byId(12).selected" /><MapTile :tile="byId(13).tile" :selected="byId(13).selected"/><MapTile :tile="byId(14).tile" :selected="byId(14).selected" /><MapTile :tile="byId(15).tile" :selected="byId(15).selected" />
  <MapTile :tile="byId(16).tile" :selected="byId(16).selected" /><MapTile :tile="byId(17).tile" :selected="byId(17).selected"/><MapTile :tile="byId(18).tile" :selected="byId(18).selected" />
  <MapTile :tile="byId(19).tile" :selected="byId(19).selected" /><MapTile :tile="byId(20).tile" :selected="byId(20).selected" /><br>
  <MapTile :tile="byId(21).tile" :selected="byId(21).selected" /><MapTile :tile="byId(22).tile" :selected="byId(22).selected"/><MapTile :tile="byId(23).tile" :selected="byId(23).selected" /><MapTile :tile="byId(24).tile" :selected="byId(24).selected" /><br>
  <MapTile tile="leftDown" /><MapTile tile="leftUp" /><MapTile tile="rightUp" /><MapTile tile="rightDown" />
  <MapTile tile="topLeft" /><MapTile tile="topRight" /><MapTile tile="bottomRight" /><MapTile tile="bottomLeft" /><MapTile tile="goal" /><br><br>
  <button>Clear</button>
  <button>Load</button>
  <button>Save</button>
  <button>Go to Level</button>
  <button>Assembly</button>

</template>

<script>
import {toRaw, isProxy} from "vue";

export default  {
  methods: {
    byId(toolId) {
      let ret = this.levelTools.filter ( el => parseInt(el.id)==parseInt(toolId) )
      if (isProxy(...ret)) {
        return toRaw(...ret)
      }
      return null
    }
  },
  data() {
    let map = []
    let tools = []
      for (let i = 0; i < 120; i++) {
        map.push( { id: i, selected: false, tile: 'empty' })
      }

    tools.push( { id: 1, selected: true, tile: 'empty'  })
    tools.push( { id: 2, selected: false, tile: 'grey1' })
    tools.push( { id: 3, selected: false, tile: 'grey2' })
    tools.push( { id: 4, selected: false, tile: 'grey3' })
    tools.push( { id: 5, selected: false, tile: 'green1' })
    tools.push( { id: 6, selected: false, tile: 'green2' })
    tools.push( { id: 7, selected: false, tile: 'green3' })

    tools.push( { id: 8, selected: false, tile: 'brown1' })
    tools.push( { id: 9, selected: false, tile: 'brown2'  })
    tools.push( { id: 10, selected: false, tile: 'brown3' })
    tools.push( { id: 11, selected: false, tile: 'brown4' })

    tools.push( { id: 12, selected: false, tile: 'blue1' })
    tools.push( { id: 13, selected: false, tile: 'blue2'  })
    tools.push( { id: 14, selected: false, tile: 'blue3' })
    tools.push( { id: 15, selected: false, tile: 'blue4' })

    tools.push( { id: 16, selected: true, tile: 'red' })
    tools.push( { id: 17, selected: false, tile: 'dark-blue' })
    tools.push( { id: 18, selected: false, tile: 'light-blue' })
    tools.push( { id: 19, selected: false, tile: 'back1' })
    tools.push( { id: 20, selected: false, tile: 'back2' })

    tools.push( { id: 21, selected: false, tile: 'down' })
    tools.push( { id: 22, selected: false, tile: 'up'  })
    tools.push( { id: 23, selected: false, tile: 'left' })
    tools.push( { id: 24, selected: false, tile: 'right' })

      return { levelMap: map, levelTools: tools }
    }
  }
</script>

<style>
@import './assets/base.css';

.levelmap {
  display: grid;
  grid-template-columns: 44px 44px 44px 44px 44px 44px 44px 44px 44px 44px 44px 44px;
  grid-gap: 0px;
  padding: 0rem;
}

#app {
  max-width: 1280px;
  margin: 0 auto;
  padding: 2rem;
  font-weight: normal;
}

</style>
