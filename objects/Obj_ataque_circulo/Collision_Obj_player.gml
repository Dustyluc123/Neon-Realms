if mudar_Spr=true{
	
	Obj_lilith.life+=400
	
if (Obj_player.tempo<=0){
	Obj_player.controle_imune =true
}


if (Obj_player.controle_imune = true){

if (Obj_player.imune = false ){	
		other.hit_alpha = 1
global.life -=5

Obj_player.controle_imune = false;

}

Obj_player.imune = true;
}

if (Obj_player.imune = true) {
	
	
	Obj_player.tempo = 30

	Obj_player.imune = false

	
}
instance_destroy()
}
