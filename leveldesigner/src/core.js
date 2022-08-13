import {ref} from "vue";

function createLevelSet() {

    let levelSet = ref([])

    for (let i = 0; i < 64; i++) {
        let level = { levelNumber: i, fadeIn: 1, fadeOut:1, data: [  [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ],
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ] ] ,
            blocksPos: [],
            blocksData: []
        }
        levelSet.value.push(level)
    }
    return levelSet
}

function createLevelMap() {
    let levelMap = ref([])


    //for (let i = 0; i < 120; i++) {
    //    levelMap.value.push({id: i, selected: false, tile: 'empty'})
   //}
    return levelMap
}

function createTools() {
    let tools = ref ([])
    tools.value.push( { id: 1, index: 0, selected: true, playable: false, tile: 'empty'  })
    tools.value.push( { id: 2, index: 1, selected: false, playable: false, tile: 'grey1' })
    tools.value.push( { id: 3, index: 2, selected: false, playable: false, tile: 'grey2' })
    tools.value.push( { id: 4, index: 3, selected: false, playable: false, tile: 'grey3' })
    tools.value.push( { id: 5, index: 4, selected: false, playable: false, tile: 'grey4' })

    tools.value.push( { id: 6, index: 5, selected: false, playable: false, tile: 'green1' })
    tools.value.push( { id: 7, index: 6, selected: false, playable: false, tile: 'green2' })
    tools.value.push( { id: 8, index: 7, selected: false, playable: false, tile: 'green3' })
    tools.value.push( { id: 9, index: 8, selected: false, playable: false, tile: 'green4', br: true })

    tools.value.push( { id: 10, index: 14, selected: false, playable: false, tile: 'blue1' })
    tools.value.push( { id: 11, index: 15, selected: false, playable: false, tile: 'blue2'  })
    tools.value.push( { id: 12, index: 16, selected: false, playable: false, tile: 'blue3' })
    tools.value.push( { id: 13, index: 17, selected: false, playable: false, tile: 'blue4' })
    tools.value.push( { id: 14, index: 18, selected: false, playable: false, tile: 'blue5' })

    tools.value.push( { id: 15, index: 19, selected: false, playable: false, tile: 'red1' })
    tools.value.push( { id: 16, index: 20, selected: false, playable: false, tile: 'red2' })
    tools.value.push( { id: 17, index: 21, selected: false, playable: false, tile: 'red3' })
    tools.value.push( { id: 18, index: 22, selected: false, playable: false, tile: 'red4', br: true })

    tools.value.push( { id: 19, index: 23, selected: false, playable: false, tile: 'light-blue1' })
    tools.value.push( { id: 20, index: 24, selected: false, playable: false, tile: 'light-blue2' })
    tools.value.push( { id: 21, index: 25, selected: false, playable: false, tile: 'light-blue3' })
    tools.value.push( { id: 22, index: 26, selected: false, playable: false, tile: 'light-blue4' })

    tools.value.push( { id: 23, index: 31, selected: false, playable: false, tile: 'fade1' })
    tools.value.push( { id: 24, index: 32, selected: false, playable: false, tile: 'fade2' })
    tools.value.push( { id: 25, index: 33, selected: false, playable: false, tile: 'fade3' })
    tools.value.push( { id: 26, index: 34, selected: false, playable: false, tile: 'fade4' })
    tools.value.push( { id: 27, index: 35, selected: false, playable: false, tile: 'fade5' })
    tools.value.push( { id: 28, index: 36, selected: false, playable: false, tile: 'fade6', br: true })

    tools.value.push( { id: 29, index: 9, selected: false, playable: false, tile: 'brown1' })
    tools.value.push( { id: 30, index: 10, selected: false, playable: false, tile: 'brown2'  })
    tools.value.push( { id: 31, index: 11, selected: false, playable: false, tile: 'brown3' })
    tools.value.push( { id: 32, index: 12, selected: false, playable: false, tile: 'brown4' })
    tools.value.push( { id: 33, index: 13, selected: false, playable: false, tile: 'brown5', br: true })

    tools.value.push( { id: 34, index: 48, selected: false, playable: true, tile: 'down' })
    tools.value.push( { id: 35, index: 49, selected: false, playable: true,tile: 'up'  })
    tools.value.push( { id: 36, index: 50, selected: false, playable: true, tile: 'left' })
    tools.value.push( { id: 37, index: 51, selected: false, playable: true, tile: 'right', br: true })

    tools.value.push( { id: 38, index: 64, selected: false, playable: true, tile: 'leftDown' })
    tools.value.push( { id: 39, index: 65, selected: false, playable: true, tile: 'leftUp'  })
    tools.value.push( { id: 40, index: 66, selected: false, playable: true, tile: 'rightUp' })
    tools.value.push( { id: 41, index: 67, selected: false, playable: true, tile: 'rightDown' })

    tools.value.push( { id: 42, index: 68, selected: false, playable: true, tile: 'topLeft' })
    tools.value.push( { id: 43, index: 69, selected: false, playable: true, tile: 'topRight'  })
    tools.value.push( { id: 44, index: 70, selected: false, playable: true, tile: 'bottomRight' })
    tools.value.push( { id: 45, index: 71, selected: false, playable: true, tile: 'bottomLeft', br: true })

    tools.value.push( { id: 46, index: 72, selected: false, playable: true, tile: 'goal',  br: true })

    tools.value.push( { id: 47, index: 37, selected: false, playable: false, tile: 'back1' })
    tools.value.push( { id: 48, index: 38, selected: false, playable: false, tile: 'back2' })
    tools.value.push( { id: 49, index: 39, selected: false, playable: false, tile: 'back-solo' })

    tools.value.push( { id: 50, index: 27, selected: false, playable: false, tile: 'bordered1' })
    tools.value.push( { id: 51, index: 28, selected: false, playable: false, tile: 'bordered2' })
    tools.value.push( { id: 52, index: 29, selected: false, playable: false, tile: 'bordered3' })
    tools.value.push( { id: 53, index: 30, selected: false, playable: false, tile: 'bordered4' })

    return tools
}

export { createLevelSet, createTools}