/**
 * 
 */
/* 함수 만드는 형식 3가지
function printInfo(){}

printInfo = function(){
	
}

printInfo = () => {
	
}*/
function printInfo(obj, out){
	str = `이름 : ${obj.name} <br>`;
	str += `가로 : ${obj.width} <br>`;
	str += `세로 : ${obj.height} <br>`;
	str += `면적 : ${obj.getArea()} <br>`;
	str += `둘레 : ${obj.getCircum()} <br>`;
	 
	document.getElementById(out).innerHTML = str;
	
}