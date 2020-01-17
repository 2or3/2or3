var init = 2520;
var max = 11;
var tmp_res = new Array();
var res = 2520;
var res1 = 0;

for(var b=0; b<=max+1; b++)
{
    tmp_res[b] = b;
}

while(tmp_res.length !== 0)
{
    res1 = decomp(res1);
}

function decomp(val){
    var val1 = 0;
    var j = 0;
    var tmp = new Array();
    j = 0;
    for(var i=0; i <= tmp_res.length; i++){
        if(val % tmp_res[i] !== 0)
        {
            console.log(tmp[i]);
            tmp[i] = tmp_res[i];
        }
    }
    val1 = val * tmp_res[a];

    return res;
}
