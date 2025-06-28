// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_personagem_colisao(){
if place_meeting(x + hveloc, y, Obj_colisao){
	while !place_meeting(x + sign(hveloc), y, Obj_colisao){
		x+= sign(hveloc);
	}
	hveloc = 0;
}
	
x +=hveloc


 
 if place_meeting(x, y + vveloc, Obj_colisao){
	while !place_meeting(x, y + sign(vveloc), Obj_colisao){
		y+= sign(vveloc);
	}
	vveloc = 0;
}
 
y +=vveloc






}
function Scr_personagem_andando(){
//Movimentação do personagem
if estado_debuff="Mind_Control"{

direita= keyboard_check(ord("A"))
cima = keyboard_check(ord("S"))
esquerda = keyboard_check(ord("D"))
baixo = keyboard_check(ord("W"))
}else{
direita= keyboard_check(ord("D"))
cima = keyboard_check(ord("W"))
esquerda = keyboard_check(ord("A"))
baixo = keyboard_check(ord("S"))
}


//Mudar as sprites

dir = floor(( point_direction(x,y,mouse_x,mouse_y) + 45 )/90);

if hveloc == 0 and vveloc == 0{
switch dir {
	default:
	     sprite_index = Spr_personagem_parado_direita
	break;
	case 1:
	     sprite_index = Spr_personagem_parado_cima
	break;
	case 2:
	     sprite_index = Spr_personagem_parado_esquerda
	break;
	case 3:
	     sprite_index = Spr_personagem_parado_baixo
	break;
}
}	else{
	switch dir {
	default:
	     sprite_index = Spr_personagem_correndo_esquerda
	break;
	case 1:
	     sprite_index = Spr_personagem_correndo_cima
	break;
	case 2:
	     sprite_index = Spr_personagem_correndo_direita
	break;
	case 3:
	     sprite_index = Spr_personagem_corrend_baixo
	break;
}
}

	
//Arma

with(my_weapon){
	
	var mb;
	var key_drop = keyboard_check_pressed(ord("F"))
	if(automatic){
		mb = mouse_check_button(mb_left)
	}else{
	    mb = mouse_check_button_pressed(mb_left)
	}
	 
	
weapon_dir = point_direction(x,y,mouse_x,mouse_y);

if(mb){
	
	atirar()
   }	
if (key_drop and weapon>0){
	weapon_drop()
}else if(key_drop and weapon ==0){
	if distance_to_object(Obj_weapon_drop)<=20{
weapon_pickup()
}
}
}


////dash
if mouse_check_button_pressed(mb_right){
    alarm[0] = 8

	dash_dir = point_direction(x, y, mouse_x, mouse_y)
	
	estado = scr_personagem_dash;

	
}

}


function scr_personagem_dash(){
	 
	hveloc = lengthdir_x(dash_veloc, dash_dir);
	vveloc = lengthdir_y(dash_veloc, dash_dir);
	
Scr_personagem_colisao()
	var _inst = instance_create_layer(x, y, "instances", Obj_dash)
	_inst.sprite_index = sprite_index
}



