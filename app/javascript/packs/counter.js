  let count = null;
  let lest = null;
  let max = 50;
  let input_area = document.getElementById("text-area");
  let output_lest = document.getElementById("text-lest");

  input_area.onkeyup = () => {
    let length = input_area.value.length;
    count = length;
    lest =  max - length;
    output_lest.innerText = lest;
  }