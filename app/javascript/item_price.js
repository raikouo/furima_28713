window.addEventListener("load", () => {
  const path = location.pathname
  const pathRegex = /^(?=.*item)(?=.*edit)/
  if (path === "/items/new" || path === "/items" || pathRegex.test(path)) {
    //    出品ページの場合　||　出品ページの検証にかかった場合 || 商品編集の場合
    const price = document.getElementById("item-price");
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    price.addEventListener("input", () => {
      const priceInput = document.getElementById("item-price").value;
      addTaxPrice.innerHTML = Math.floor(priceInput * 0.1);
      profit.innerHTML = Math.floor(priceInput * 0.9);
    });
  };
});