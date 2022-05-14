import {ref} from "vue";

function createLevelMap() {
    let levelMap = ref([])

    for (let i = 0; i < 120; i++) {
        levelMap.value.push({id: i, selected: false, tile: 'grey2'})
    }
    return levelMap
}

function createTools() {
    let tools = ref ([])
    tools.value.push( { id: 1, selected: true, tile: 'empty'  })
    tools.value.push( { id: 2, selected: false, tile: 'grey1' })
    tools.value.push( { id: 3, selected: false, tile: 'grey2' })
    tools.value.push( { id: 4, selected: false, tile: 'grey3' })
    tools.value.push( { id: 5, selected: false, tile: 'green1' })
    tools.value.push( { id: 6, selected: false, tile: 'green2' })
    tools.value.push( { id: 7, selected: false, tile: 'green3' })

    tools.value.push( { id: 8, selected: false, tile: 'brown1' })
    tools.value.push( { id: 9, selected: false, tile: 'brown2'  })
    tools.value.push( { id: 10, selected: false, tile: 'brown3' })
    tools.value.push( { id: 11, selected: false, tile: 'brown4', br: true })

    tools.value.push( { id: 12, selected: false, tile: 'blue1' })
    tools.value.push( { id: 13, selected: false, tile: 'blue2'  })
    tools.value.push( { id: 14, selected: false, tile: 'blue3' })
    tools.value.push( { id: 15, selected: false, tile: 'blue4' })

    tools.value.push( { id: 16, selected: false, tile: 'red' })
    tools.value.push( { id: 17, selected: false, tile: 'dark-blue' })
    tools.value.push( { id: 18, selected: false, tile: 'light-blue' })
    tools.value.push( { id: 19, selected: false, tile: 'back1' })
    tools.value.push( { id: 20, selected: false, tile: 'back2', br: true })

    tools.value.push( { id: 21, selected: false, tile: 'down' })
    tools.value.push( { id: 22, selected: false, tile: 'up'  })
    tools.value.push( { id: 23, selected: false, tile: 'left' })
    tools.value.push( { id: 24, selected: false, tile: 'right', br: true })

    tools.value.push( { id: 25, selected: false, tile: 'leftDown' })
    tools.value.push( { id: 26, selected: false, tile: 'leftUp'  })
    tools.value.push( { id: 27, selected: false, tile: 'rightUp' })
    tools.value.push( { id: 28, selected: false, tile: 'rightDown' })

    tools.value.push( { id: 29, selected: false, tile: 'topLeft' })
    tools.value.push( { id: 30, selected: false, tile: 'topRight'  })
    tools.value.push( { id: 31, selected: false, tile: 'bottomRight' })
    tools.value.push( { id: 32, selected: false, tile: 'bottomLeft' })
    tools.value.push( { id: 33, selected: false, tile: 'goal' })
    return tools
}

export { createLevelMap, createTools}