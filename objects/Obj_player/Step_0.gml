hit_alpha = lerp(hit_alpha,0,0.1);
if(global.life<=0){
	
	game_end()
	
}

if global.dialogo = false{
script_execute(estado)
}
 
 if imune = true {
	 
	 hit_alpha = 1
 }else{
   hit_alpha = 0
 }

hit_alpha = lerp(hit_alpha,0,0.1);


tempo = max(tempo - 1, 0)


if distance_to_object(Obj_ncp_parent)<= 10{
	
	if keyboard_check_pressed(ord("E")) and global.dialogo = false{
		var _npc = instance_nearest(x,y,Obj_ncp_parent)
		var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo)
		_dialogo.npc_nome = _npc.nome;
	   
		
	}
}