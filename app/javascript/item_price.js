window.addEventListener("turbolinks:load", () => {
  const price = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("input", () => {
    const priceInput = document.getElementById("item-price").value;
    addTaxPrice.innerHTML = Math.floor(priceInput * 0.1);
    profit.innerHTML = Math.floor(priceInput * 0.9);
  })
});