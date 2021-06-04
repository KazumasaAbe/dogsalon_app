<template>
  <v-form class="form-top-magrin">
   <v-container>
    <div>
      <canvas 
      id="canvas"
      v-bind:class="{ eraser: canvasMode === 'eraser' }"
      width="500"
      height="300"
      ref="canvas"
      @mousedown="dragStart" 
      @mouseup="dragEnd"
      @mouseout="dragEnd"
      @mousemove="draw"
      >
      </canvas>
      <!--
        @mousedown = マウスボタンを押した時
        @mouseup = マウスボタンを離した時
        @mouseout = マウスカーソルが外れた時
        @mousemove = マウスカーソルが移動している時
        @ = v-onの省略形
      -->
      <div id="img-box">
        <img id="newImg"
        width="500"
        height="300"
        >
        </div>
    </div>
    <v-col cols="8">
      <div class="btn-items">
        <div class="btn-item">
          <v-btn 
            @click="clear"
            label="clear"
          >
            リセット
          </v-btn>
        </div>

        <div class="btn-item">
          <v-btn 
            @click="eraser"
            label="eraser"
          >
            消しゴム
          </v-btn>
        </div>

        <div class="btn-item">
          <v-btn 
          @click="pen"
          label="pen"
          >
            ペン
          </v-btn>
        </div>
        <div class="btn-item">
        <v-color-picker
         class="ma-2"
         hide-inputs
         v-model="color"
         ></v-color-picker>
        </div>
        <div class="btn-item">
          <v-btn 
            label="change"
            @click="imgChange"
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
  name: "CallCanvase",
  data() {
    return {
      canvasMode: 'pen',
        canvas: null,
        context: null,
        isDrag: false,
        color: "#6B8CFF",
    };
  },

  watch: {
    color(){//ペンの色が変わればcanvasのコンテキストに反映される
      this.context.strokeStyle = this.color;
    }
  },
  // 監視対象に変化が起きたら登録した処理を自動で行ってくれるもの

  mounted() {
    this.canvas = this.$refs.canvas
    // querySelector = 任意のHTML要素を検出・取得を行う
    this.context = this.$refs.canvas.getContext("2d");
    // getContext('XX') = グラフィックを描画するためのメソッドやプロパティを持つオブジェクトを返す
    //('2d) = 引数に('2d')を渡すと2Dグラフィックを描画するためのメソッドやプロパティを持つオブジェクトを返す
    this.context.lineCap = 'round'
    // 先端の形状の指定('round', 'butt', 'square')
    this.context.lineJoin = 'round'
    // 線の結合箇所の指定('bevel','round','miter')
    this.context.lineWidth = 5;
    // 線の幅を指定
    this.context.strokeStyle = this.color;
    // 線・輪郭の色やスタイルを指定
  },
  


  methods: {
    pen() {
      this.canvasMode = 'pen'
      this.context.lineCap = 'round'
      this.context.lineJoin = 'round'
      this.context.lineWidth = 5;
      console.log(this.color)
      this.context.strokeStyle = this.color;
    },
    eraser() {
      this.canvasMode = 'eraser'
      this.context.lineCap = 'square'
      this.context.lineJoin = 'square'
      this.context.lineWidth = 30;
      this.context.strokeStyle = '#FFFFFF'
    },
    draw(e) {
      var x = e.layerX
      var y = e.layerY
      //x = e.layerX
      // 現在のレイヤーの相対的なイベント発生場所の水平位置を返す
      //y = e.layerY
      // 現在のレイヤーの相対的なイベント発生場所の垂直位置を返す
      if (!this.isDrag) {
        return;
      }

      this.context.lineTo(x, y);
      // パスの現在の点からcanvas内の指定した点へ線を引く(x,y 2つのパラメータをとる)
      this.context.stroke();
      // 現在の線スタイルでサブパスを輪郭表示する
    },
    dragStart(e) {
      //x = e.layerX
      //y = e.layerY
      var x = e.layerX
      var y = e.layerY

      this.context.beginPath();
      // 現在のパスのリセット
      this.context.lineTo(x, y);
      this.context.stroke();
      this.isDrag = true;
    },
    dragEnd() {
      this.context.closePath();
      // 最終座標と開始座標を結んで閉じる
      this.isDrag = false;
    },
    clear() {
      this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
      // 四角形の形にクリアするときに使用
      // X 四角形の左上の座標 Y 四角形の左上の座標 W 四角形の幅 H 四角形の高さ
    },
    imgChange() {
      var png = canvas.toDataURL();
      console.log(png)
      document.getElementById("newImg").src = png
    },
  }
}
</script>

<style scoped>
canvas {
  position: relative;
  border:1px solid #000;
}
#newImg {
  position: relative;
  border:1px solid #000;
}
.btn-items {
  display: flex;
  justify-content: space-around;
}
.eraser {
    cursor: url(/assets/eraser.png) 15 15,auto;
}

</style>
