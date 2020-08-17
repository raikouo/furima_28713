window.addEventListener("DOMContentLoaded", () => {
  let price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    let priceInput = document.getElementById("item-price").value
    const tax = 0.1;
    let fee_price = priceInput * tax;
    let profit = priceInput - fee_price;
    document.getElementById("add-tax-price").innerHTML = fee_price;
    document.getElementById("profit").innerHTML = profit;
  })
});