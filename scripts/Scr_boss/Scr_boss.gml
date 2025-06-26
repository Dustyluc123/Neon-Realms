
function Scr_Boss_escolher_ataque(){
	switch(Obj_inimigo.estado3){
	
	case "parado":
	 var range = 300;
	var linha =  collision_line(x,y,Obj_player.x,Obj_player.y,Obj_colisao_inimigo,false,false)
	 if(distance_to_object(Obj_player))<= range and !linha {
		 Obj_inimigo.estado3="seguindo_jogador";
	 }
	break;
	
	
	case"seguindo_jogador":
var x1 = x
var y1 = y
var x2 = (Obj_player.x div 32)* 32 + 16
var y2 = (Obj_player.y div 32)* 32 + 16

if(mp_grid_path(Obj_map.grid,Obj_inimigo.caminho,x1,y1,x2,y2,true)){
	path_start(Obj_inimigo.caminho,Obj_inimigo.velc,path_action_stop,false)
}


	break;
	
}




Obj_inimigo.hit_alpha = lerp(Obj_inimigo.hit_alpha,0,0.1);

	
	
	
	
	
	if alarm[0] <=0{
		
 var _ataque = choose(Scr_boss_ataque_1, Scr_boss_ataque_2)
		
 estado2 = _ataque
 alarm[0] = 240
 
 
}

}

function Scr_boss_ataque_1(){
	var _dir = 0;
	repeat(8){
		var _inst = instance_create_layer(x,y,"Instances",Obj_lamina)
		_inst.speed = 2;
		_inst.direction = _dir;
		
		_dir+=45
}

estado2 = Scr_Boss_escolher_ataque;
}

function Scr_boss_ataque_2(){
	repeat(6){
		var _xx = irandom_range(x - 100,x + 100);
		var _yy = irandom_range(y - 100,y + 100);
		
		instance_create_layer(_xx,_yy,"Instances",Obj_boss_ataque_1)
	}
	estado2= Scr_Boss_escolher_ataque
}

