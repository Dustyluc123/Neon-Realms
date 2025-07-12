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
hveloc = (direita - esquerda) * veloc
 vveloc = (baixo - cima) * veloc


Scr_personagem_colisao()

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
// Só executa a lógica se o jogador tiver uma arma equipada
    if (instance_exists(my_weapon))
    {
        // Posiciona a arma visualmente e define a sua direção
        with(my_weapon) {
            weapon_dir = point_direction(other.x, other.y, mouse_x, mouse_y);
            image_angle = weapon_dir;
            x = other.x + lengthdir_x(6, weapon_dir);
            y = other.y + lengthdir_y(6, weapon_dir);
        }

        // Lógica de Tiro
        var mb;
        // A verificação agora lê a variável 'automatic' DO JOGADOR!
        if (automatic) {
            mb = mouse_check_button(mb_left);
        } else {
            mb = mouse_check_button_pressed(mb_left);
        }
        
        if (mb) {
            atirar(); // Chama a função de tiro
        }
    }
    
    // --- LÓGICA DE LARGAR A ARMA CORRIGIDA ---
    // Esta lógica agora está FORA do 'with(my_weapon)'
    var key_drop = keyboard_check_pressed(ord("F"));
    if (key_drop && weapon > 0) // "weapon" é a variável do jogador com o ID da arma
    {
        // Cria a arma no chão
        var _inst_drop = instance_create_layer(x, y, "Instances", drop);
        
        // "Etiqueta" o item no chão com o ID da arma que o jogador estava a usar
        _inst_drop.weapon = weapon; 
        
        // O resto da sua lógica de física do drop
        _inst_drop.image_angle = my_weapon.image_angle;
        _inst_drop.direction = my_weapon.image_angle;
        _inst_drop.speed = 3;
        
        // Equipa "mãos vazias"
        Scr_mudar_arma(self, 0);
    }
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



