<script setup>
import MapTile from "./components/MapTile.vue";
import {createLevelSet, createTools} from "./core.js";
import {toRaw,ref} from "vue";


let tools = createTools()
let levelSet = createLevelSet()
let currentLevelNumber = ref(0)
let currentLevel = ref({})
let assemblyData = ref("")
let blocksVisible = ref(false)

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
  console.log(blocksVisible.value)
  tools.value.forEach( t => {
    t.selected=false
    if (t.id == e.target.dataset.id) {
      if (blocksVisible.value == false && t.playable == false) {
        t.selected = true
      }
      if (blocksVisible.value == true && t.playable == true) {
        t.selected = true
      }

    }
 } )
}

function toLeveMap(e, r, i) {

  let proxiedTool = tools.value.filter( t => t.selected)[0]
  let tool = (toRaw(proxiedTool))

  if (blocksVisible.value == true && tool.playable==true) {
    let pos = r * 12 + i
    console.log('setting block data -> pos ', {pos})
    let idx = currentLevel.value.blocksPos.indexOf(pos);
    if (idx == -1) {
      currentLevel.value.blocksPos.push(pos)
      currentLevel.value.blocksData.push(tool.id)
    } else {
      currentLevel.value.blocksPos.splice(idx,1)
      currentLevel.value.blocksData.splice(idx,1)
      currentLevel.value.blocksPos.push(pos)
      currentLevel.value.blocksData.push(tool.id)
    }
  } else {
    currentLevel.value.data[r][i] = tool.id
  }




}

function clearLevel() {
  currentLevel.value.data =  [  [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
    [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
    [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
    [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
    [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
    [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
    [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
    [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
    [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
    [ 1,1,1,1,1,1,1,1,1,1,1,1 ] ]
  currentLevel.value.blocksPos = []
  currentLevel.value.blocksData = []


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
function findById2(row, column, id) {
  let pos = row * 12 + column
  let idToShow = id
  //console.log('row, column, id, pos', {row, column, id, pos})
  let idx = currentLevel.value.blocksPos.indexOf(pos);
  if (blocksVisible.value == true && idx > -1) {
      idToShow = currentLevel.value.blocksData[idx];
      console.log('pos, idx, idToShow', {pos, idx, idToShow})
  }
  return findById(idToShow)
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
  if (ev.target.files.length == 1) {
    let fileToRead = ev.target.files[0];
    console.log(fileToRead)
    let reader = new FileReader();
    reader.onload = function(e) {
      let content = e.target.result;
      console.log(content);
      let intern = JSON.parse(content);
      console.log(intern);
      levelSet.value = intern
      currentLevelNumber.value = 0
      blocksVisible.value = true
      currentLevel.value = levelSet.value[currentLevelNumber.value]
    };
    reader.readAsText(fileToRead);
  }
}

function toAssembly() {
  let pre = []
  let post = []
  let lp = []
  let lp_idx = 1
  let ld = []
  let ld_idx = 1
  let ldd_idx = 0



  let level = levelSet.value[0]


  pre[0] = "LEVELS: {"
  pre[1] = "    .align $100"
  pre[2] = "    LevelPointerData:"



  let blockz = []


  levelSet.value.forEach( lev => {
    lp[lp_idx] = "      .word level_" + lev.levelNumber
    ld[ld_idx] = "    level_" + lev.levelNumber + ":"
    let ldd_idx = 0
    for (let i = 0; i < 10 ; i++) {
      ld_idx++
      ld[ld_idx] = "      .byte " + lev.data[ldd_idx].map(v => findById(v).index).map( v => '$' + v.toString(16).padStart(2,'0'))
      ldd_idx ++
    }
    ld_idx++
    ld[ld_idx] = "      .byte " + level.levelNumber +  "         //level number"
    ld_idx++
    ld[ld_idx] = "      .byte 4          //tries"
    ld_idx++
    ld[ld_idx] = "      .byte 60         //time in seconds"
    ld_idx++
    ld[ld_idx] = "      .byte 1,2        //in- and out sequence"


    let blockz = []
    for (let ii = 0; ii < lev.blocksPos.length ; ii++) {
      blockz.push(lev.blocksPos[ii])
      blockz.push(findById(lev.blocksData[ii]).index)
    }
    blockz.push(255)
    ld_idx++
    ld[ld_idx] = "      .byte " + blockz.map( v => '$' + v.toString(16).padStart(2,'0'))

    ld_idx++
    lp_idx++


  })



  post[0]= "\r\n}"
  let assembly = pre.join('\r\n') +  lp.join('\r\n') +  ld.join('\r\n') + post[0]
  assemblyData.value = assembly
}


</script>

<template>
  <div class="levelmap">
    <MapTile v-for="(t,i) in currentLevel.data[0]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(0,i,t).id" :tile="findById2(0,i,t).tile" :selected="false" @click="toLeveMap($event,0,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[1]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(1,i,t).id" :tile="findById2(1,i,t).tile" :selected="false" @click="toLeveMap($event,1,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[2]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(2,i,t).id" :tile="findById2(2,i,t).tile" :selected="false" @click="toLeveMap($event,2,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[3]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(3,i,t).id" :tile="findById2(3,i,t).tile" :selected="false" @click="toLeveMap($event,3,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[4]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(4,i,t).id" :tile="findById2(4,i,t).tile" :selected="false" @click="toLeveMap($event,4,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[5]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(5,i,t).id" :tile="findById2(5,i,t).tile" :selected="false" @click="toLeveMap($event,5,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[6]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(6,i,t).id" :tile="findById2(6,i,t).tile" :selected="false" @click="toLeveMap($event,6,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[7]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(7,i,t).id" :tile="findById2(7,i,t).tile" :selected="false" @click="toLeveMap($event,7,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[8]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(8,i,t).id" :tile="findById2(8,i,t).tile" :selected="false" @click="toLeveMap($event,8,i)"/>
    <MapTile v-for="(t,i) in currentLevel.data[9]" :data-level="currentLevelNumber" :data-id=i :data-tool-id="findById2(9,i,t).id" :tile="findById2(9,i,t).tile" :selected="false" @click="toLeveMap($event,9,i)"/>
  </div>
  <br>
  <template v-for="t in tools">
    <MapTile :data-id=t.id :tile="t.tile" :selected="t.selected" @click="toolSelected" />
    <br v-if="t.br" />
  </template>
  <br><br>
  <input id="blockz" type="checkbox" v-model="blocksVisible" ><label for="blockz"> activate blockzs overlay</label>
  <br><br>
  Level: {{ currentLevelNumber }} <br>
  <button @click="clearLevel">Clear</button>
  <button @click="levelUp"> + </button>
  <button @click="levelDown"> - </button>
  <button @click="toAssembly">Assembly</button>
  <button @click="downloadLevelData">Download</button>
  <input type="button" id="upload" value="Upoad" onclick="document.getElementById('file').click();"/>
  <input type="file" style="display:none;" id="file" name="file" @change="uploadLevelData"/>
  <br><br>
  <textarea type="textarea" rows="10" cols="75">{{ assemblyData }}</textarea>


</template>

<style>
@import 'assets/leveldesigner.css';
</style>
