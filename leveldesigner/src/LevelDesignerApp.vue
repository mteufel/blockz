<script setup>
import MapTile from "./components/MapTile.vue";
import {createLevelSet, createTools} from "./core.js";
import {toRaw,ref} from "vue";


let tools = createTools()
let levelSet = createLevelSet()
let currentLevelNumber = ref(1)
let currentLevel = ref({})

currentLevel.value = levelSet.value[currentLevelNumber.value]
console.log('currentLevel', toRaw(currentLevel.value))


function levelUp() {
  currentLevelNumber.value = currentLevelNumber.value + 1
  currentLevel.value = levelSet.value[currentLevelNumber.value]
}

function levelDown() {
  currentLevelNumber.value = currentLevelNumber.value - 1
  currentLevel.value = levelSet.value[currentLevelNumber.value]
}

function toolSelected(e) {
  tools.value.forEach( t => {
    t.selected=false
    if (t.id == e.target.dataset.id) {
      t.selected = true
    }
 } )
}

function toLeveMap(e, r, i) {

  let proxiedTool = tools.value.filter( t => t.selected)[0]
  let tool = (toRaw(proxiedTool))

  currentLevel.value.data[r][i] = tool.id

}

function clearMap() {
  levelMap.value.forEach( t => {
      t.tile = 'empty'
  } )
}

function fillWithSelected() {
  let proxiedTool = tools.value.filter( t => t.selected)[0]
  let tool = (toRaw(proxiedTool))
  levelMap.value.forEach( t => {
    t.tile = tool.tile
  } )
}

function findById(id) {
  let proxiedTool = tools.value.filter( t => t.id==id)[0]
  return proxiedTool
}

function downloadLevelData() {
  let data = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(levelSet.value));
  let downloadAnchorNode = document.createElement('a');
  downloadAnchorNode.setAttribute("href",  data);
  downloadAnchorNode.setAttribute("download", "block-leveldata.json");
  document.body.appendChild(downloadAnchorNode);
  downloadAnchorNode.click();
  downloadAnchorNode.remove();
}
function uploadLevelData(ev) {
  console.log(ev.target.files)
  let fileToRead = ev.target.files[0];
  console.log(fileToRead)
  let reader = new FileReader();
  reader.onload = function(e) {
    let content = e.target.result;
    console.log(content);
    let intern = JSON.parse(content);
    console.log(intern);
    };
   reader.readAsText(fileToRead);
}


</script>

<template>
  <div class="levelmap">
    <MapTile v-for="(t,i) in currentLevel.data[0]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,0,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[1]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,1,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[2]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,2,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[3]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,3,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[4]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,4,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[5]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,5,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[6]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,6,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[7]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,7,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[8]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,8,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[9]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById(t).id" :tile="findById(t).tile" :selected="false" @click="toLeveMap($event,9,i)"/>
  </div>
  <br>
  <template v-for="t in tools">
    <MapTile :data-id=t.id :tile="t.tile" :selected="t.selected" @click="toolSelected" />
    <br v-if="t.br" />
  </template>
  <br><br>
  Level: {{ currentLevelNumber }} <br>
  <button @click="clearMap">Clear</button>
  <button @click="levelUp"> + </button>
  <button @click="levelDown"> - </button>
  <button>Assembly</button>
  <button @click="downloadLevelData">Download</button>
  <input type="button" id="upload" value="Upoad" onclick="document.getElementById('file').click();"/>
  <input type="file" style="display:none;" id="file" name="file" @click="uploadLevelData"/>


</template>

<style>
@import 'assets/leveldesigner.css';
</style>
