// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_texto(){

  switch npc_nome{
	  
	  case "Car":
	  ds_grid_add_text("Bom dia",Spr_retrado,0,"personagem 1")
	  ds_grid_add_text("Eae bom dia.",Spr_retrado2,1,"Car")
	    ds_grid_add_text("O que temos para hoje?",Spr_retrado,0,"personagem 1")
	  ds_grid_add_text("Treino de tiro ao alvo",Spr_retrado2,1,"Car")
	 
	  break;
	 
  }
   switch npc_nome{
	  
	  case "Elisa":
	  ds_grid_add_text("Bom dafeasfdgia",Spr_retrado,0,"personagem 1")
	  ds_grid_add_text("Eae bsergfhom dia.",Spr_retrado2,1,"Car")
	    ds_grid_add_text("O que asdgfngrdgfnhtemos para hoje?",Spr_retrado,0,"personagem 1")
	  ds_grid_add_text("Treino desdfe tiro ao alvo",Spr_retrado2,1,"Car")
	  break;
	  
  }
}
function ds_grid_add_row(){
	///@arg ds_grid
 
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);	
}
function ds_grid_add_text(){
	///@arg texto
	///@arg retrato
	///@arg lado
	///@arg nome
 
	var _grid = texto_grid;
	var _y = ds_grid_add_row(_grid);
 
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
}