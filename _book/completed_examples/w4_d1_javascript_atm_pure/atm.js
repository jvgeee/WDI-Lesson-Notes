// Create files

// Create variables for bank account balances

// Get all html elements from DOM and save as variables
// #checkingBalance  -> Display of checkings balance
// #checkingDeposit  -> Deposit button for checking
// #checkingWithdraw -> Withdraw button for checking
// #checkingAmount   -> Input for checking
// #savingsBalance  -> Display of savings balance
// #savingsDeposit  -> Deposit button for savings 
// #savingsWithdraw -> Withdraw button for savings
// #savingsAmount   -> Input for savings

window.onload = function(){

  var checkingBalance = 0;
  var savingsBalance  = 0;
  var checkingDisplay  = document.getElementById("checkingBalance");
  var checkingDeposit  = document.getElementById("checkingDeposit");
  var checkingWithdraw = document.getElementById("checkingWithdraw");
  var checkingAmount   = document.getElementById("checkingAmount");
  var savingsDisplay   = document.getElementById("savingsBalance");
  var savingsDeposit   = document.getElementById("savingsDeposit");
  var savingsWithdraw  = document.getElementById("savingsWithdraw");
  var savingsAmount    = document.getElementById("savingsAmount");

  checkingDeposit.addEventListener("click", function(){
    // console.log("checkingDeposit");
    var amount = parseInt(checkingAmount.value);
    checkingBalance += amount;
    // console.log(checkingBalance);
    updateDisplay();
  });

  checkingWithdraw.addEventListener("click", function(){
    // console.log("checkingWithdraw");
    var amount = parseInt(checkingAmount.value);
    var balances = withdrawFunds(amount, checkingBalance, savingsBalance);
    checkingBalance = balances[0];
    savingsBalance  = balances[1];
    updateDisplay();
  });

  savingsDeposit.addEventListener("click", function(){
    // console.log("savingsDeposit");
    var amount = parseInt(savingsAmount.value);
    savingsBalance += amount;
    console.log(savingsBalance);
    updateDisplay();
  });

  savingsWithdraw.addEventListener("click", function(){
    console.log("savingsWithdraw");
    var amount = parseInt(savingsAmount.value);
    var balances = withdrawFunds(amount, savingsBalance, checkingBalance);
    savingsBalance  = balances[0];
    checkingBalance = balances[1];
    updateDisplay();
  });

  function updateDisplay() {
    if (checkingBalance <= 0) {
      checkingDisplay.classList.add("zero");
    } else {
      checkingDisplay.classList.remove("zero");
    }

    if (savingsBalance <= 0) {
      savingsDisplay.classList.add("zero");
    } else {
      savingsDisplay.classList.remove("zero");
    }

    checkingDisplay.innerHTML = "$" + checkingBalance;
    savingsDisplay.innerHTML  = "$" + savingsBalance;
    checkingAmount.value      = "";
    savingsAmount.value       = "";
  }

  function withdrawFunds(amount, primary, secondary) {
    if (amount <= primary) {
      primary -= amount;
    } else if ((amount > primary) && (amount <= (secondary + primary))) {
      secondary = (primary + secondary) - amount;
      primary   = 0; 
    }
    return [primary, secondary];
  }

  updateDisplay();
}