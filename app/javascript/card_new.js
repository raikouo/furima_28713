if (document.URL.match( /cards\/new/ ) ) {
  window.addEventListener("load", () => {
    const cardNumber = document.getElementById("number");
    const cardImageNumber = document.getElementById("new-card-image-number");
    const expMonth = document.getElementById("exp_month");
    const expYear = document.getElementById("exp_year");
    const cardExpMonth = document.getElementById("card-exp-month");
    const cardExpYear = document.getElementById("card-exp-year");
    cardNumber.addEventListener("input", () => {
      const cardNumberInput = document.getElementById("number").value;
      const pattern = /^\d*$/;
      if (cardNumberInput.match(pattern)){
        cardImageNumber.innerHTML = cardNumberInput.substr(0,4) + " " +
        cardNumberInput.substr(4,4) + " " + cardNumberInput.substr(8,4) + " " + cardNumberInput.substr(12,4);
      };
    });
    expMonth.addEventListener("input", () => {
      let expMonthInput = document.getElementById("exp_month").value;
      expMonthInput = ('00' + expMonthInput ).slice( -2 );
      cardExpMonth.innerHTML = expMonthInput;
    });
    expYear.addEventListener("input", () => {
      const expYearInput = document.getElementById("exp_year").value;
      cardExpYear.innerHTML = expYearInput;
    });
  });
};