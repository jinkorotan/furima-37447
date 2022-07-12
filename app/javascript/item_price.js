
//商品出品機能////////////////////////////////////////////////////

window.addEventListener('load', () => {
   //addEventListener()メソッドとは、イベント発火の際に実行する関数を定義するためのメソッド
const priceInput = document.getElementById("item-price");
//item-priceにマッチするidを持つHTMLの要素を取得することができる
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    //add-tax-priceにマッチするidを持つHTMLの要素を取得することができる
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
    //addTaxDomにMath.floor(priceInput.value * 0.1 )を代入
    const addProfitDom = document.getElementById("profit");
     //profitにマッチするidを持つHTMLの要素を取得することができる
    addProfitDom.innerHTML = Math.floor(priceInput.value * 0.9 );
    //addProfitDomにMath.floor(priceInput.value * 0.9 )を代入
  })   
});
//商品出品機能////////////////////////////////////////////////////

