const pay = () => {
  Payjp.setPublicKey("pk_test_ba76172010e2394ba70076d1");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_buy[number]"),
      cvc: formData.get("user_buy[cvc]"),
      exp_month: formData.get("user_buy[exp_month]"),
      exp_year: `20${formData.get("user_buy[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card_number").removeAttribute("name");
      document.getElementById("card_cvc").removeAttribute("name");
      document.getElementById("card_exp_month").removeAttribute("name");
      document.getElementById("card_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);