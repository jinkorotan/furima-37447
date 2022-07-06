const pay = () => {
  Payjp.setPublicKey("pk_test_7396bc24b1d653b5375a80b3"); // PAY.JPテスト公開鍵
   const submit = document.getElementById("button");
   submit.addEventListener("click", (e) => {
     e.preventDefault();
     

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
   
    const card = {
      number: formData.get("order_shipping[number]"),
      cvc: formData.get("order_shipping[cvc]"),
      exp_month: formData.get("order_shipping[exp_month]"),
      exp_year: `20${formData.get("order_shipping[exp_year]")}`,
      //formDataオブジェクトからクレジットカードに関する情報を取得して変数cardに代入

    };
    Payjp.createToken(card, (status, response) => {
    
      if (status == 200) {
        //statusはトークンの作成がうまくなされたかどうかを確認できる、HTTPステータスコードが入る
        //HTTPステータスコードが200のとき、すなわちうまく処理が完了したときだけ、トークンの値を取得する
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token}name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
       
      }
        //insertAdjacentHTMLメソッド HTMLを挿入したい要素に対して使うメソッドで、第一引数にHTMLを挿入したい位置、第二引数に挿入したいHTMLを記述
        //beforeendは挿入したい位置、tokenObjは挿入したいHTML

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name")
      //フォームに存在するクレジットカードの各情報を削除

      document.getElementById("charge-form").submit();
       //フォームの情報をサーバーサイドに送信
    });s
  });
};

window.addEventListener("load", pay);
//ページが読み込まれた時に、payという変数に代入したアロー関数が実行される