var Area = function() {};

Area.version = '1.0';

Area.triangle = function(base, height) {
  return base * height / 2;
}

Area.diamond = function(width, height) {
  return width * height / 2;
}

console.log('Areaクラスのバージョン：' + Area.version);
console.log('三角形の面積：' + Area.triangle(5, 3));
var a = new Area();
console.log(a.diamond);
