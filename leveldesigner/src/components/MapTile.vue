<template>
  <div :class="css"> </div>
</template>

<script>
export default {
  name: "MapTile",
  props: ['tile', 'selected'],
  computed: {
      css() {
        if (this.selected) {
          return "tile tile-" + this.tile + " selected"
        } else {
          return "tile tile-" + this.tile
        }

      }
  }
}
</script>

<style scoped>
@import '../assets/leveldesigner.css';
</style>