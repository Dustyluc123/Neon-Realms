
function Scr_lilith_escolher_ataque(){
	switch(Obj_lilith.estado3){
	
	case "parado":
	 var range = 300;
	 var linha =  collision_line(x,y,Obj_player.x,Obj_player.y,Obj_colisao_inimigo,false,false)
	 if(distance_to_object(Obj_player))<= range and !linha {
		 Obj_lilith.estado3="seguindo_jogador";
	 }
	break;
	
	
	case"seguindo_jogador":
var x1 = x
var y1 = y
var x2 = (Obj_player.x div 32)* 32 + 16
var y2 = (Obj_player.y div 32)* 32 + 16

if(mp_grid_path(Obj_map.grid,Obj_lilith.caminho,x1,y1,x2,y2,true)){
	path_start(Obj_lilith.caminho,Obj_lilith.velc,path_action_stop,false)
}


	break;
	
}




Obj_lilith.hit_alpha = lerp(Obj_lilith.hit_alpha,0,0.1);

	
	
	
	
	
	if alarm[0] <=0{
		
 var _ataque = choose( Scr_lilith_ataque_2,Scr_lilith_ataque_3,Scr_lilith_ataque_4)
		
 estado2 = _ataque
 if Obj_lilith.life<=6000{
 alarm[0] = 90
 }else{
 alarm[0] = 180
 }
}

}


function Scr_lilith_ataque_2(){

	repeat(3){
		
		var _xx = irandom_range(x - 100,x + 100);
		var _yy = irandom_range(y - 100,y + 100);
		
		instance_create_layer(_xx,_yy,"Instances",Obj_morcego)
	}
	estado2= Scr_lilith_escolher_ataque

}

function Scr_lilith_ataque_3(){
	repeat(1){

		var _xx = irandom_range(x - 100,x + 100);
		var _yy = irandom_range(y - 100,y + 100);
		
		instance_create_layer(_xx,_yy,"Instances",Obj_ataque_circulo)
	}
	estado2= Scr_lilith_escolher_ataque

}
function Scr_lilith_ataque_4(){
	var _dir =Obj_player;
	
	repeat(1){
		var _inst = instance_create_layer(x,y,"Instances",Obj_Mind_control)
		_inst.speed = 3;
		_inst.direction = _dir
	
}

estado2 = Scr_lilith_escolher_ataque;
}


