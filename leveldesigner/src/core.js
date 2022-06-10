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
                [ 1,1,1,1,1,1,1,1,1,1,1,1 ] ] }
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
    tools.value.push( { id: 1, selected: true, tile: 'empty'  })
    tools.value.push( { id: 2, selected: false, tile: 'grey1' })
    tools.value.push( { id: 3, selected: false, tile: 'grey2' })
    tools.value.push( { id: 4, selected: false, tile: 'grey3' })
    tools.value.push( { id: 5, selected: false, tile: 'grey4' })

    tools.value.push( { id: 6, selected: false, tile: 'green1' })
    tools.value.push( { id: 7, selected: false, tile: 'green2' })
    tools.value.push( { id: 8, selected: false, tile: 'green3' })
    tools.value.push( { id: 9, selected: false, tile: 'green4', br: true })

    tools.value.push( { id: 10, selected: false, tile: 'blue1' })
    tools.value.push( { id: 11, selected: false, tile: 'blue2'  })
    tools.value.push( { id: 12, selected: false, tile: 'blue3' })
    tools.value.push( { id: 13, selected: false, tile: 'blue4' })
    tools.value.push( { id: 14, selected: false, tile: 'blue5' })

    tools.value.push( { id: 15, selected: false, tile: 'red1' })
    tools.value.push( { id: 16, selected: false, tile: 'red2' })
    tools.value.push( { id: 17, selected: false, tile: 'red3' })
    tools.value.push( { id: 18, selected: false, tile: 'red4', br: true })

    tools.value.push( { id: 19, selected: false, tile: 'light-blue1' })
    tools.value.push( { id: 20, selected: false, tile: 'light-blue2' })
    tools.value.push( { id: 21, selected: false, tile: 'light-blue3' })
    tools.value.push( { id: 22, selected: false, tile: 'light-blue4' })

    tools.value.push( { id: 23, selected: false, tile: 'fade1' })
    tools.value.push( { id: 24, selected: false, tile: 'fade2' })
    tools.value.push( { id: 25, selected: false, tile: 'fade3' })
    tools.value.push( { id: 26, selected: false, tile: 'fade4' })
    tools.value.push( { id: 27, selected: false, tile: 'fade5' })
    tools.value.push( { id: 28, selected: false, tile: 'fade6', br: true })

    tools.value.push( { id: 29, selected: false, tile: 'brown1' })
    tools.value.push( { id: 30, selected: false, tile: 'brown2'  })
    tools.value.push( { id: 31, selected: false, tile: 'brown3' })
    tools.value.push( { id: 32, selected: false, tile: 'brown4' })
    tools.value.push( { id: 33, selected: false, tile: 'brown5', br: true })

    tools.value.push( { id: 34, selected: false, tile: 'down' })
    tools.value.push( { id: 35, selected: false, tile: 'up'  })
    tools.value.push( { id: 36, selected: false, tile: 'left' })
    tools.value.push( { id: 37, selected: false, tile: 'right', br: true })

    tools.value.push( { id: 38, selected: false, tile: 'leftDown' })
    tools.value.push( { id: 39, selected: false, tile: 'leftUp'  })
    tools.value.push( { id: 40, selected: false, tile: 'rightUp' })
    tools.value.push( { id: 41, selected: false, tile: 'rightDown' })

    tools.value.push( { id: 42, selected: false, tile: 'topLeft' })
    tools.value.push( { id: 43, selected: false, tile: 'topRight'  })
    tools.value.push( { id: 44, selected: false, tile: 'bottomRight' })
    tools.value.push( { id: 45, selected: false, tile: 'bottomLeft', br: true })

    tools.value.push( { id: 46, selected: false, tile: 'goal',  br: true })

    tools.value.push( { id: 47, selected: false, tile: 'back1' })
    tools.value.push( { id: 48, selected: false, tile: 'back2' })
    tools.value.push( { id: 49, selected: false, tile: 'back-solo' })

    tools.value.push( { id: 50, selected: false, tile: 'bordered1' })
    tools.value.push( { id: 51, selected: false, tile: 'bordered2' })
    tools.value.push( { id: 52, selected: false, tile: 'bordered3' })
    tools.value.push( { id: 53, selected: false, tile: 'bordered4' })

    return tools
}

export { createLevelSet, createTools}