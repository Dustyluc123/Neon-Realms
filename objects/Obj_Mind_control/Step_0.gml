if Mind_control = true {
	
	Obj_player.estado_debuff="Mind_Control"
	
}

switch(estado3){
	
	case "parado":
	 var range = 300;
	var linha =  collision_line(x,y,Obj_player.x,Obj_player.y,Obj_colisao_inimigo,false,false)
	 if(distance_to_object(Obj_player))<= range and !linha {
		estado3="seguindo_jogador";
	 }
	break;
	
	
	case"seguindo_jogador":
var x1 = x
var y1 = y
var x2 = (Obj_player.x div 32)* 32 + 16
var y2 = (Obj_player.y div 32)* 32 + 16

if(mp_grid_path(Obj_map.grid,caminho,x1,y1,x2,y2,true)){
	path_start(caminho,velc,path_action_stop,false)
}


	break;
	
}
