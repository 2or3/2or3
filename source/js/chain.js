var Animal = function(){ };
Animal.prototype = {
  work : function(){ return console.log("トコトコ..."); }
};

var Dog = function(){ };
Dog.prototype = new Animal;
Dog.prototype.bark = function (){ console.log("わんわん..."); }

var dog = new Dog();
dog.work();
dog.bark();
