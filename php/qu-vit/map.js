// JavaScript Document

document.onmousemove = Mouse_xypos;

array_X = new Array();
array_Y = new Array();
var M_x, M_y;
var w_x, w_y;
var fl = "0";
var mTo, lTo, lin;
var bon, sx, sy;
var ar_sl;

/* 座標取得 */
function Mouse_xypos(myEvents){
	if(document.all){
		M_x = event.x;
		M_y = event.y;
	}else{
		M_x = myEvents.pageX;
		M_y = myEvents.pageY;
	}
	Dsp_pos();
	fl = "1";
}

function ar_ini(){
        //やじるし描画処理
        for(a = 0; a < n; a++)
        {
                var dr = Number(dr_ar[a]);
                //alert(dr);
                if(dr != null)
                {
                        for(b = 0; b < n; b++)
                                if(dr == Number(cid_ar[b]))
                                        arr(a, b, ln_ar[a]);
                }
        }
}

function bringToFlont(id) {
    var v = $('#' + id);
    v.appendTo(v.parent());
}

function createXmlHttpRequest() {
  if (window.XMLHttpRequest) {             // Firefox,Opera,Safari,IE7
    return new XMLHttpRequest();
  } else if (window.ActiveXObject) {                 // IE6
    try {
      return new ActiveXObject("Msxml2.XMLHTTP");    // MSXML3
    } catch(e) {
      return new ActiveXObject("Microsoft.XMLHTTP"); // MSXML2まで
    }
  } else {
    return null;
  }
}

function eval( eid, idx ) {
  //object
  var xmlhttp = createXmlHttpRequest();

  //open
  xmlhttp.open("GET", "eval.php?cid=" + cid_ar[idx] + "&evl=" + eid, true);	

  //event
  xmlhttp.onreadystatechane = function()
  {
    if(xmlhttp.readyState==4)
    {
      if(xmlhttp.status == 200)
      {
        //callback
        on_loaded(xmlhttp);
      }else{
        alert(xmlhttp.status);
      }
    }
  }
  //send
  xmlhttp.send(null);  

}

function on_loaded(oj)
{
  res = oj.responsText;
  alert(res);
}

function can()
{
  $("#box").remove();
  fl = "2";
  document.onmousemove = Mouse_xypos;
  evl_bt();
}

function evl_bt()
{
  var ne = en;
  var enb = en;

  for(h = 0; h < n; h++)
  {
    var at1 = "a1t" + "" + h;
    var at2 = "a2t" + "" + h;
    var at3 = "a3t" + "" + h;

    document.getElementById(at1).disabled = false;
    document.getElementById(at2).disabled = false;
    document.getElementById(at3).disabled = false;

    var en_sub = 0;
    for(f = enb - ne; f < enb; f++)
    {

      if(cid_ar[h] == cmid_ar[f])
      {
        switch (evid_ar[f]){
          case "1":
            document.getElementById(at1).disabled = true;
            break;
          case "2":
            document.getElementById(at2).disabled = true;
            break;
          case "3":
            document.getElementById(at3).disabled = true;
            break;
          default:
            break;
        }
          en_sub++;
      }else{
        ne = ne - en_sub;
        break;
      }
    }
  }
}

function map_init(){
	var enb = en;
	//ボックス描画処理
	for(h = 0; h < n; h++)
	{
		var ne = en;
		var cy = cy_ar[h];
		var cx = cx_ar[h];
		array_X[h] = Number(cx);
		array_Y[h] = Number(cy);
		var bn = "box" + "" + h;
		var bnt = "boxtx" + "" + h;
		var dvt = "dv" + "" + h;
		var at1 = "a1t" + "" + h;
		var at2 = "a2t" + "" + h;
		var at3 = "a3t" + "" + h; 
                tx_arr = tx_ar[h].split("*+*");
                var txin = tx_arr[0];
		var br = "<br/>";
                for(d = 1; d < tx_arr.length; d++)
                        txin += "<br/>" + tx_arr[d];
		br += "<br/><br/><br/>";
		$("#map_area").append('<div id=' + bn + ' style="top: '+ cy +'px; left: ' + cx + 'px; width: 200px; height: 150px; min-width: 200px; min-height: 150px; background-color: white; position: absolute; border: 1px solid #000; overflow: hidden; z-index: ' + h + ' " onMouseOver="document.getElementById(\'' + dvt + '\').style.display=\'\'; this.style.height=\'auto\'; this.style.width=\'auto\'; this.style.zIndex=\'' + n  + '\'; " onMouseOut="document.getElementById(\'' + dvt + '\').style.display=\'none\'; this.style.height=\'150px\'; this.style.width=\'200px\'; this.style.zIndex=\'' + h + '\'" ><img src=' + img_ar[h] + ' align="left"></img><span style="font-size:x-small;" >' + dt_ar[h] + '</span><br/><i>' + ujb_ar[h] + '</i><br/><a href="">' + unm_ar[h] + '<a><br clear="left"><div id=' + bnt + ' ></div>' + br + '<div id="' + dvt + '" name="' + dvt + '" style="display:none" ><input id=' + at1 + ' name=' + at1 + ' type="button" onclick="eval(1, ' + h + '); this.disabled=true;" value="創" /><input id=' + at2 + ' name=' + at2 + ' type="button" onclick="eval(2, ' + h + '); this.disabled=true;" value="知" /><input id=' + at3 + ' name=' + at3 + ' type="button" onclick="eval(3, ' + h + '); this.disabled=true;" value="感" /></div></div>');
		document.getElementById(bnt).innerHTML = txin;
		var en_sub = 0;
//alert("enb:" + enb + "en:" + en);
		for(f = enb - ne; f < enb; f++)
		{
//alert ("h:" + h + " cid:" + cid_ar[h] + " f:" + f + " cmid:" + cmid_ar[f] + " evid:" + evid_ar[f] );
			if(cid_ar[h] == cmid_ar[f])
			{
//alert ("h:" + h + "cid:" + cid_ar[h] + "f:" + f + "cmid:" + cmid_ar[f] + "evid:" + evid_ar[f] );
				switch (evid_ar[f]){
					case "1":
						document.getElementById(at1).disabled = true;
						break;
					case "2":
						document.getElementById(at2).disabled = true;
						break;
					case "3":
						document.getElementById(at3).disabled = true;
						break;
					default:
						break;
				}
				en_sub++;
			}else{
				ne = ne - en_sub;
				break;
			}
		}
	}
	ar_ini();
	//やじるし描画処理
/*
	for(a = 0; a < n; a++)
	{
		var dr = Number(dr_ar[a]);
		//alert(dr);
		if(dr != null)
		{
			for(b = 0; b < n; b++)
				if(dr == Number(cid_ar[b]))
					arr(a, b, ln_ar[a]);
		}
	}
*/

	if(h < 1)
	{
	        $("#map_area").append('<div id="box" style="top: 10px; left: 10px;"></div>');
        	$("#box").append('<textarea id="txtarea" cols="5" rows="3" maxlength="140" placeholder="ここに書きこんでください" ></textarea><div><select name="arrow" id="arrow" style="display:none" ><option value="0">矢印を引かない</select><input type="button" id="submit" value="送信" onclick="sub()" /></div>');
        	if(document.all){
                	document.getElementById("map_area").detachEvent("onclick", Mouse_Click);
        	}else{
                	document.getElementById("map_area").removeEventListener("click", Mouse_Click, false);
        	}
	}
	document.getElementById("sub_area_width").value = 800;
	w_y = 10;
	w_x = 10;
}

function arr(m, l, ln){
        var canvas = document.getElementById("map_canv")
        var context = canvas.getContext("2d");
        context.strokeStyle = 'rgb(255,255,255)';

	var X1 = array_X[m];
	var Y1 = array_Y[m];
	var X2 = array_X[l];
	var Y2 = array_Y[l];
	var ctr_X;
	var ctr_Y;
	var sl = (Y2 - Y1) / (X1 - X2);
        var dxc1 = Math.sqrt(49/(1 + sl * sl));
        var dyc1 = dxc1 * sl;
        var dxc2 = Math.sqrt(100/(1 + sl * sl));
        var dyc2 = dxc2 * sl;
        var dxc3 = Math.sqrt(144/(1 + sl * sl));
        var dyc3 = dxc3 * sl;
        var bsxc = ctr_X + dxc2;
        var bsyc = ctr_Y - dyc2;

	if(X1 > X2)
	{
		if(sl > 3/4)
		{
			ctr_X = (75/sl) + X2 + 100;
			ctr_Y = Y2;
	                bsxc = ctr_X + dxc1;
        	        bsyc = ctr_Y - dyc1;
		}
		else if(sl <= 3/4 && sl >= -3/4)
		{
			ctr_Y = Y2 + 75 - (100*sl);
			ctr_X = X2 + 200;
	                bsxc = ctr_X + dxc1;
        	        bsyc = ctr_Y - dyc1;
		}
		else if(sl < -3/4)
		{
			ctr_X = (-75/sl) + X2 + 100;
			ctr_Y = Y2 + 150;
                        bsxc = ctr_X + dxc2;
                        bsyc = ctr_Y - dyc2;
		}
	}
	else if(X1 < X2)
	{
		if(sl > 3/4)
		{
			ctr_X = (-75/sl) + X2 + 100;
			ctr_Y = Y2 + 150;
                        bsxc = ctr_X - dxc2;
                        bsyc = ctr_Y + dyc2;
		}
		else if(sl <= 3/4 && sl >= -3/4)
		{
			ctr_X = X2;
			ctr_Y = Y2 + 75 + (100*sl);
                        bsxc = ctr_X - dxc1;
                        bsyc = ctr_Y + dyc1;
		}
		else if(sl < -3/4)
		{
			ctr_X = (75/sl) + X2 + 100;
			ctr_Y = Y2;
                        bsxc = ctr_X - dxc1;
                        bsyc = ctr_Y + dyc1;
		}
	}
	else if(X1 == X2)
	{
		if(Y1 < Y2)
		{
			ctr_Y = Y2;
			ctr_X = X2 + 100;
			bsxc = ctr_X;
                        bsyc = ctr_Y - 7;
		}
		else if(Y1 >= Y2)
		{
			ctr_Y = Y2 + 150;
			ctr_X = X2 + 100;
                        bsxc = ctr_X;
                        bsyc = ctr_Y + 10;
		}
	}

//        alert(array_X[l]);
        context.beginPath();
        context.moveTo(array_X[m] + 100 ,array_Y[m] + 75);
        context.lineTo(array_X[l] + 100 ,array_Y[l] + 75);
	context.stroke();

	if(ln == "1")
	{
		var cir = canvas.getContext("2d");
		cir.beginPath();
		cir.strokeStyle = 'rgb(255,255,255)';
		cir.fillStyle = 'rgb(255,255,255)';
		cir.arc(bsxc, bsyc, 7, 0, Math.PI*2, false);
		cir.fill();
	}else if(ln == "2"){
		var dx = Math.sqrt(25/(1 + sl * sl));
		var dy = dx * sl;
                var dxm = Math.sqrt(75/(1 + (1/sl) * (1/sl)));
                var dym = dxm * (1/sl);

		if(X1 >= X2)
		{
			var bsx = bsxc + dx;
			var bsy = bsyc - dy;
	                var tr_X1 = bsx + dxm;
        	        var tr_Y1 = bsy + dym;
                	var tr_X2 = bsx - dxm;
                	var tr_Y2 = bsy - dym;
		}
		else
		{
			var bsx = bsxc - dx;
			var bsy = bsyc + dy;
                	var tr_X1 = bsx + dxm;
                	var tr_Y1 = bsy + dym;
        	        var tr_X2 = bsx - dxm;
	                var tr_Y2 = bsy - dym;
		}
		var tri = canvas.getContext("2d");
		tri.beginPath();
		tri.srokeStyle = 'rgb(255,255,255)';
		tri.fillStyle = 'rgb(255,255,255)';
		tri.moveTo(ctr_X, ctr_Y);
		tri.lineTo(tr_X1, tr_Y1);
		tri.lineTo(tr_X2, tr_Y2);
		tri.closePath();
		tri.fill();
	}else{
	}
}

//評価ボタンdisable
function eval_dabl(lim)
{
	for(a1 = 0; a1 < lim; a1++)
	{
		at1 = "a1t" + "" + a1;
		at2 = "a2t" + "" + a1;
		at3 = "a3t" + "" + a1;
		document.getElementById(at1).disabled = true;
		document.getElementById(at2).disabled = true;
		document.getElementById(at3).disabled = true;
	}
}

/* クリックイベント追加 */
function Dsp_pos(){
	document.getElementById("pos").innerHTML='X位置＝' + M_x + ':Y位置＝' + M_y;
	if(fl != "1")
	{
		if(document.all)
		{
			document.getElementById("map_area").attachEvent("onclick", Mouse_Click);
		}else{
			document.getElementById("map_area").addEventListener("click", Mouse_Click, false);
		}
		if(fl == "0")
			map_init();
		fl = "1";
	}
}


/* エリア内マウスクリック処理 */
function Mouse_Click(){
//エリア内フラグ
var flg = "0";
for(i = 0; i < n; i++)
{
if(M_y - 20 >= array_Y[i] - 20 && M_y - 20 <= array_Y[i] + 170 && M_x - 20 >= array_X[i] - 20 && M_x - 20 <= array_X[i] + 220){
//他のボックス内であれば線を引く
	flg = "1";
}
else if(M_y + 170 >= array_Y[i] - 20 && M_y + 120 <= array_Y[i] + 170 && M_x + 220 >= array_X[i] - 20 && M_x + 220 <= array_X[i] + 220){
	flg = "1";
}
else if(M_y + 120 >= array_Y[i] - 20 && M_y + 120 <= array_Y[i] + 170 && M_x - 20 >= array_X[i] - 20 && M_x - 20 <= array_X[i] + 220){
	flg = "1";
}
else if(M_y - 20 >= array_Y[i] - 20 && M_y - 20 <= array_Y[i] + 170 && M_x + 220 >= array_X[i] - 20 && M_x + 220 <= array_X[i] + 220){
	flg = "1";
}else if(M_y == null || M_x == null){
	flg = "1";
}
}

//エリア内外判定
if(flg == "0"){
//ボックス外であれば新しいボックスを作る
	w_y = M_y;
	w_x = M_x;

	eval_dabl(n);

	$("#map_area").append('<div id="box" style="top: '+ M_y +'px; left: ' + M_x +'px;"></div>');
	$("#box").append('<textarea id="txtarea" cols="5" rows="3" maxlength="140" placeholder="ここに書きこんでください" ></textarea><div><select name="arrow" id="arrow" ><option value="1">矢印を引く（賛成）<option value="2">矢印を引く（反対）<option value="0">矢印を引かない</select><input type="button" id="submit" value="送信" onclick="sub()" /><input type="button" id="cancel" value="取り消し" onclick="can()" /></div>');
	if(document.all){
		document.getElementById("map_area").detachEvent("onclick", Mouse_Click);
	}else{
		document.getElementById("map_area").removeEventListener("click", Mouse_Click, false);
	}
	wd = Number(wdth);
	if(wd < M_y + 150 || wd < M_x + 200)
		document.getElementById("sub_area_width").value = wd + 300;
	else
		document.getElementById("sub_area_width").value = wd;
}else{
}
}

/* 入力後ボックス生成処理 */
function sub(){
	ar_sl = document.getElementById("arrow").selectedIndex;
	var txt = document.getElementById("txtarea").value;
	if(txt == ""){
		alert("コメントを記述してください");
		return false;
	}
	bon = "box" + "" + n;
	bont = "boxtx" + "" + n;
	dd = new Date();
	yy = dd.getYear();
	mm = dd.getMonth();
	dt = dd.getDate();
	hh = dd.getHours();
	mn = dd.getMinutes();
	ss = dd.getSeconds();
	if(yy < 2000) { yy += 1900; }
	if(mm < 10) { mm = "0" + mm; }
	if(dt < 10) { dt = "0" + dt; }
	if(hh < 10) { hh = "0" + hh; }
	if(mn < 10) { mn = "0" + mn; }
	if(ss < 10) { ss = "0" + ss; }
	var ctm = yy + "-" + mm + "-" + dt + " " + hh + ":" + mn + ":" + ss;
//	alert(bon);
	$("#box").replaceWith('<div id=' + bon + ' style="top: '+ w_y +'px; left: ' + w_x +'px; width: 200px; height: 150px; background-color: white; position: absolute; border: 1px solid #000; " ><img src=' + uimg + ' align="left" ></img><span style="font-size:x-small;" >' + ctm + '</span><br/><i>' + ujob  + '</i><br/><a href="">' + unam  + '</a><br clear="left"><div id=' + bont + '></div><div style="display:none" onmouseover="this.style.display=block" onmouseout="this.style.display=none"><a href="">創</a><a href="">知</a><a href="">感</a></div></div>');
	var txarr = txt.split("\n");
	var txtn = txarr[0];
	for(c = 1; c < txarr.length; c++)
		txtn += "*+*" + txarr[c];
	document.getElementById(bont).innerHTML = txt;
	document.getElementById("sub_txt").value = txtn;
	document.getElementById("sub_x").value = w_x;
	document.getElementById("sub_y").value = w_y;
	document.getElementById("sub_cdt").value = ctm;

	n++;
	array_X[n] = w_x;
	array_Y[n] = w_y;
	mTo = n;
	lin = ln_ar[n];
	
	if(n > 1)
	{
		if(ar_sl != " 2")
		{
			sx = w_x;
			sy = w_y;
			document.onmousemove = Select_arr;
			if(document.all)
			{
				document.getElementById("map_area").detachEvent("onclick", Mouse_Click);
				document.getElementById("map_area").attachEvent("onclick", Mouse_Click2);
			}else{
				document.getElementById("map_area").removeEventListener("click", Mouse_Click, false);
				document.getElementById("map_area").addEventListener("click", Mouse_Click2, false);
			}
			M_x = 0;
			M_y = 0;
		}else{
			document.getElementById("sub_ln").value = null;
			document.getElementById("sub_drid").value = null;
			document.getElementById("form1").submit();
		}
	}else{
                document.getElementById("sub_ln").value = null;
                document.getElementById("sub_drid").value = null;
		document.getElementById("form1").submit();
	}
	fl = "2";
}

function ar_dl(){
  var cnv1 = document.getElementById("map_canv")
  var cntx1 = cnv1.getContext("2d");
  cntx1.strokeStyle = 'rgb(255,255,255)';

  cntx1.beginPath();
  cntx1.clearRect(0, 0, cnv1.width, cnv1.height);
  cntx1.restore();
  cntx1 = null;
  cnv1 = null;
}

function Select_arr(myEvents)
{
  if(document.all){
    M_x = event.x;
    M_y = event.y;
  }else{
    M_x = myEvents.pageX;
    M_y = myEvents.pageY;
  }
  document.getElementById("pos").innerHTML='X位置＝' + M_x + ':Y位置＝' + M_y;
  
  var cnv = document.getElementById("map_canv")
  var cntx = cnv.getContext("2d");
  cntx.strokeStyle = 'rgb(255,255,255)';
  
  ar_dl();

  ar_ini();

  cntx.beginPath();
  cntx.moveTo(sx + 100 ,sy + 75);
  cntx.lineTo(M_x, M_y);
  cntx.stroke();
  bx = M_x;
  by = M_y;
}

/* 接続先ボックス選択時 */
function Mouse_Click2(){
var ck_fl = "0";
for(j = 0; j <= n; j++)
{
//存在するボックス内でクリックされた場合
        if(M_y >= array_Y[j] && M_y <= array_Y[j] + 150 && M_x >= array_X[j] && M_x <= array_X[j] + 200){
                ck_fl = "1";
                lTo = j;
        }else{
//ボックスが存在しないエリア内でクリックされた場合
        }
}
if(ck_fl == "1"){
//存在するボックス内でクリックされた場合
//矢印描画処理
	document.onmousemove = Mouse_xypos;
	lin = ln_sel();
        arrow(mTo, lTo, lin)
        if(document.all){
                document.getElementById("map_area").detachEvent("onclick", Mouse_Click2);
                document.getElementById("map_area").attachEvent("onclick", Mouse_Click);
        }else{
                document.getElementById("map_area").removeEventListener("click", Mouse_Click2, false);
                document.getElementById("map_area").addEventListener("click", Mouse_Click, false);
        }
}else{
//ボックスが存在しないエリア内でクリックされた場合
        alert("BOXを選択してください");}
}

function ln_sel(){
	if(ar_sl == "0")
		return "1";
	else if(ar_sl == "1")
		return "2";
}

/* 矢印描画処理 */
function arrow(mT, lT, ln){
//	alert("mTo:" + "" + mT + ",lTo:" + "" + lT);
        document.getElementById("sub_ln").value = ln;
	document.getElementById("sub_drid").value = cid_ar[lT];
	ar_dl();
	ar_ini();
	arr(mT, lT, ln);

	document.getElementById("form1").submit();
}
