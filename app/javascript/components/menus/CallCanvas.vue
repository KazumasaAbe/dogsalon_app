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
    <v-col cols="6">
    <div class="btn-items">
      <div class="btn-item">
      <v-btn 
        @click="false"
        label="back"
      >
      戻る
      </v-btn>
      </div>

      <div class="btn-item">
      <v-btn 
        @click="false"
        label="go"
      >
      進む
      </v-btn>
      </div>

        <div class="btn-item">
        <v-btn 
        @click="false"
        label="reset"
      >
      リセット
      </v-btn>
      </div>

      <div class="btn-item">
      <v-btn 
        @click="false"
        label="save"
      >
      保存
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
    mode: '',
    brushColor: '',
    defaultMode: 'brush',
    defaultBrushColor: '#FFFFFF'
  }),
  mounted: function() {
    this.init();
  },
  methods: {
    // モードとペンの色を初期状態にする
    init: function() {
      this.mode = this.defaultMode;
      this.brushColor = this.defaultBrushColor;
    }
  }
}
</script>

<style scoped>
canvas {
  position: relative;
  border:3px solid #000;
}
.btn-items {
  display: flex;
  justify-content: space-around;
}

  

</style>
