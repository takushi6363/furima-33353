function check(){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener('input',function(){
    let fee = itemPrice.value * 0.1
    let profitPrice = itemPrice.value - fee
    let addTaxPrice = document.getElementById('add-tax-price');
    addTaxPrice.innerText =`${fee}`
    let profit = document.getElementById('profit');
    profit.innerText = `${profitPrice}`
  })
}

window.addEventListener("load", check);

