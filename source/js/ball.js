var input = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

var j = input.length;
while (j) {
   var k = Math.floor(Math.random() * j);
   var t = input[--j];
   input[j] = input[k];
   input[k] = t;
}

var b = 0, c = 0;

for (var i = 0; i < input.length; i++) {
  if (b < input[i]) {
    b = input[i];
  } else if(c < input[i]) {
    c = input[i];
  } else {
    console.log('NG');
    i = input.length;
  }

  if (i == input.length - 1) {
    console.log('OK');
  }
}

console.log(input);
