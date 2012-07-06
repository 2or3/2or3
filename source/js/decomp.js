var max = 20;
var tmp_res = new Array();
var init = 2520;
var response = solve(init);

console.log(response);

function solve(res)
{
    for (var j = 0; j < max; j++)
    {
        tmp_res[j] = j + 1;
    }

    while (tmp_res.length !== 0)
    {
        res = refinement(res);
    }
    return res;
}

function refinement(val)
{
    var tmp = new Array();
    var j = 0;

    for (var i = 0; i < tmp_res.length; i++)
    {
        if(val % tmp_res[i] !== 0)
        {
            tmp[j] = tmp_res[i];
            j++;
        }
    }

    if (tmp.length !== 0)
    {
        if (isPrimNum(val))
        {
            val = val * rmp[0];
        }else{
            val = decomp(val, tmp[0]);
        }
    }
    tmp_res = new Array();
    tmp_res = tmp;
    return val;
}

function decomp(val1, val2)
{
    v1 = val1;
    v2 = val2;
    while(v1 !== v2)
    {
        if (v1 > v2)
        {
            if (v1 % v2 === 0)
            {
                return v1;
            }else{
                v2 = v2 + val2;
            }
        }else{
            if (v2 % v1 === 0)
            {
                return v2;
            }else{
                v1 = v1 + val1;
            }
        }
    }
    return v1;
}

function isPrimNum(val)
{
    var maxNum = val;
    for (var k = 2; maxNum > k; k++)
    {
        if (val % k === 0 && val !== k)
        {
            return false;
        }
        maxNum = Math.ceil(val / k);
    }
    return true;
}
