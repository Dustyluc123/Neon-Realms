if fim_da_animacao(){
	repeat(2){
		var _dir = 0
		var _inst = instance_create_layer(x,y,"Instances",Obj_lamina)
		_inst.speed = 2;
		_inst.direction = _dir;
		
		_dir+=45
	}
	instance_destroy()
}

