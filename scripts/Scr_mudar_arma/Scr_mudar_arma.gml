// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_mudar_arma(_id,index){
	
	weapon = index;
	
var map = _id.armas[_id.weapon];
_id.sprite=map[?"sprite"];
_id.proj=map[?"proj"];
_id.proj_spd=map[?"proj_spd"];
_id.proj_damage=map[?"proj_damage"];
_id.proj_delay=map[?"proj_delay"]
_id.automatic=map[?"automatic"];
_id.drop=map[?"drop"];

}