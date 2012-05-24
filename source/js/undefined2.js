var Member = function(){ };
Member.prototype.sex = 'man';

var mem = new Member();
mem.sex = undefined;
console.log(mem.sex);
for (var key in mem)
{
  console.log(key + ':' + mem[key]);
}

