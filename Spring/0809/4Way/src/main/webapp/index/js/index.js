/**
 * 
 */
const outMapColor = "#021B79"; //지도 기본색깔
let clickedID = ""; //클릭한ID

/* 호버와 같은 기능(마우스를 올렸을 때 색깔 변경) 시작 */
const chgColorIn = function(obj, mapColors){
	
	let mapID = obj.id;
	const mapColor = mapColors;
	
	if(mapID.substr(0,1) == "L"){
		mapID = mapID.substr(1);
	}
	
	let map = document.getElementById(mapID);
	let mapText = document.getElementById("L" + mapID);
	
	map.style.transition = "fill 0.4s ease-in-out 0.1s";
	map.style.fill = mapColor;
	map.style.cursor="pointer";
	mapText.style.cursor="pointer";
	
}

const chgColorOut = function(obj){
	
	let mapID = obj.id;  
	
	if(mapID.substr(0,1) == "L"){
		mapID = mapID.substr(1);
	}
	
	if(clickedID == mapID){

	}else{
		let map = document.getElementById(mapID);
		map.style.fill = outMapColor;	
	}
		
}

/* 호버와 같은 기능 끝*/

/* 클릭했을 때 색깔변경 */
const clickMap = function(obj, mapColors){
	
	let mapID = obj.id;
	const mapColor = mapColors;
	
	clickedID = "";
	
	if(mapID.substr(0,1) == "L"){
		mapID = mapID.substr(1);
	}
			
	const mapNameLists = document.getElementsByName("mapChk");

	for(var i=0; i<mapNameLists.length; i++){
		mapNameLists[i].style.fill = outMapColor;
	}
	
	let map = document.getElementById(mapID);
	map.style.fill = mapColor;
	clickedID = mapID;
	isClicked = true;
	
}