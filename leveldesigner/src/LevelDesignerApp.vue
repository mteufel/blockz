<script setup>
import MapTile from "./components/MapTile.vue";
import {createLevelMap, createTools } from "./core.js";

let levelMap = createLevelMap()
let tools = createTools()

function toolSelected(e) {
  tools.value.forEach( t => {
    t.selected=false
    if (t.id == e.target.dataset.id) {
      t.selected = true
    }
  } )
}

</script>

<template>
  <div class="levelmap">
    <MapTile v-for="t in levelMap" :tile="t.tile" :selected="t.selected"/>
  </div>
  <br>
  <template v-for="t in tools">
    <MapTile :data-id=t.id :tile="t.tile" :selected="t.selected" @click="toolSelected" />
    <br v-if="t.br" />
  </template>
  <br><br>
  <button @click="test">Clear</button>
  <button @click="test">Load</button>
  <button>Save</button>
  <button>Go to Level</button>
  <button>Assembly</button>
</template>

<style>
@import 'assets/leveldesigner.css';
</style>
