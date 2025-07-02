///OBJ_Dialogo

if inicializar == false{
	Scr_texto()
	inicializar= true
	
}

if mouse_check_button_pressed(mb_left){
	if carac < string_length(texto_grid[# infos.Texto, pagina]){
		
		carac = string_length(texto_grid[# infos.Texto, pagina])
	
	}else{
		
		alarm[0] = 1
		carac = 0
	if pagina < ds_grid_height(texto_grid) - 1 {
		pagina++;
	}else{

    global.dialogo = false;
	instance_destroy()	
	}
}
}


