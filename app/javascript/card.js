const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
debugger;
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult)
 console.log(formData)

    const card = {
      number: formData.get("pay_form[number]"),
      cvc: formData.get("pay_form[cvc]"),
      exp_month: formData.get("pay_form[exp_month]"),
      exp_year: `20${formData.get("pay_form[exp_year]")}`,
    };
console.log(card)
    Payjp.createToken(card, (status, response) => {
      // console.log(error_messages)
      // console.log(responce)
      if (status == 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' > `;
        console.log(tokenObj)
        debugger
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};
window.addEventListener("load",pay)