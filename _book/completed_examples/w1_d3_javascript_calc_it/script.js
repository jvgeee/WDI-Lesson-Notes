var calculationType = prompt("Which operation would you like to do ? b(a)sic, (m)ortgage, (b)mi, (t)rip or (q)uit");

while(calculationType != "q"){
  switch(calculationType){
    case "a" :// basic calc
      var num1 = parseFloat(prompt("first number"));
      var operationType = prompt("(a)dd, (s)ubtract, (m)ultiply or (d)ivide");
      var num2 = parseFloat(prompt("second number"));
      switch(operationType){
        case "a":
          var answer = num1 + num2;
          break;
        case "s":
          var answer = num1 - num2;
          break;
        case "m":
          var answer = num1 * num2;
          break;
        case "d":
          var answer = num1 / num2;
          break;
      }
      alert("The result is "+ answer)

    break;
    case "m" :
      var loan = parseFloat(prompt("loan ($)"));
      var apr = parseFloat(prompt("apr")) / 100 / 12;
      var term = parseInt(prompt("Term (months)"));

      var temp = Math.pow((1 + apr), term);
      var payment = (loan * apr * temp / (temp - 1)).toFixed(2);
      alert(" Your monthly payment will be $" + payment)
    break;

    case "b" :
      var mass = parseFloat(prompt("Mass (KG)"));
      var height = parseFloat(prompt("height (Meters)"));

      var bmi = (mass / Math.pow(height, 2)).toFixed(2);

      alert(" Your BMI is " + bmi);
    break;

    case "t" :
      var dist = parseFloat(prompt("Distance (miles)"));
      var mpg = parseFloat(prompt("Miles per gallon"));
      var cost = parseFloat(prompt("Cost ($/gallon)"));
      var speed = parseFloat(prompt("MPH"));

      var time = (dist / speed).toFixed(2);

      if(mpg > 60){
        var actualMPG = mpg - (speed - 60) * 2;
      } else{
        var actualMPG = mpg;
      }

      var cost = (dist / actualMPG * cost);

      alert("Your trip will take " + time + "hours and cost $" + cost)

    break;
  }
  var calculationType = prompt("Which operation would you like to do ? b(a)sic, (m)ortgage, (b)mi, (t)rip or (q)uit");
}
















