if(instance_exists(weapon_id)){
	
	x = weapon_id.x;
	y = weapon_id.y;
	

	weapon_x = x + lengthdir_x(6,weapon_dir);
	weapon_y = y + lengthdir_y(6,weapon_dir);
	
    image_angle = weapon_dir;
	
	function atirar(){
		//vamos atirar
		
		if (! weapon > 0){
		return false;	
		}
		
		if(!can_shoot){
			return false;
		}
	
		
		var proj_inst = instance_create_layer(weapon_x,weapon_y,"projeteis",Obj_proj)
		proj_inst.sprite_index = proj
		proj_inst.image_angle = weapon_dir
		proj_inst.speed = proj_spd;
		proj_inst.direction = weapon_dir
		proj_inst.damage=proj_damage
		can_shoot = false
		alarm[0] = proj_delay
    }
function weapon_drop(){
	if (!weapon > 0){
		return false;
	}
	var inst = instance_create_layer(weapon_x,weapon_y,layer,drop)
	inst.image_angle = weapon_dir;
	inst.direction= weapon_dir
	inst.speed = 3
	Scr_mudar_arma(self,0)
}

function weapon_pickup(){

  var inst = instance_nearest(x,y,Obj_weapon_drop)
   if (instance_exists(inst)){
	 
	   Scr_mudar_arma(self,inst.weapon_index);
	   instance_destroy(inst)
	 
   }

}
	



}


else{
	instance_destroy()
}	