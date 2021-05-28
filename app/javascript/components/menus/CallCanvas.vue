<template>
  <v-form class="form-top-magrin">
  　<v-container>
    <div>
      <canvas 
      id="canvassample"
      width="500"
      height="300"
      >
      </canvas>
    </div>
    <v-col cols="5">
    <div class="btn-items">
      <div class="btn-item">
      <v-btn 
        @click="clearCanvas()"
        label="clear"
      >
      リセット
      </v-btn>
      </div>

      <div class="btn-item">
      <v-btn 
        @click="prevCanvas()"
        label="prev"
      >
      戻る
      </v-btn>
      </div>

        <div class="btn-item">
        <v-btn 
        @click="nextCanvas()"
        label="next"
      >
      進む
      </v-btn>
      </div>

      <div class="btn-item">
      <v-btn 
        @click="changeImg"
        label="change"
        value="1"
      >
      画像変換
      </v-btn>
      </div>
    </div>
    </v-col>
    </v-container>
  </v-form>
</template>

<script>

export default {
  data: () => ({
  }),
 
}
</script>

<style scoped>
canvas {
  position: relative;
  border:1px solid #000;
}
.btn-items {
  display: flex;
  justify-content: space-around;
}

  

</style>
