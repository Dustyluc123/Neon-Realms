if estado = Scr_personagem_andando{
if (tempo<=0){
	controle_imune =true
}


if (controle_imune = true){

if (imune = false ){	
	hit_alpha = 1
global.life -=1

controle_imune = false;

}

imune = true;
}

if (imune = true) {
	
	
	tempo = 30

	imune = false

	
}
}
	


