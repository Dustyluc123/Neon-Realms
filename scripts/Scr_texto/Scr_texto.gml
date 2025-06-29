// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_texto(){

  switch npc_nome{
	  
	  case "Tyler":
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

	   case "sa":
	  ds_grid_add_text("Boia",Spr_retrado,0,"personagem 1")
	  ds_grid_add_text("Eae m dia.",Spr_retrado2,1,"Car")
	    ds_grid_add_text("O que asdgfngrdgfnhtemos para hoje?",Spr_retrado,0,"personagem 1")
	  ds_grid_add_text("Trero ao alvo",Spr_retrado2,1,"Car")
	  break;
	  
  }
     switch npc_nome{
	  
	  case "Espelho":
	  ds_grid_add_text("Por algum motivo eu não consigo me ver nessas coisas, parece preguiça do criador eu não me ver nisso. Talvez eu seja um vampiro",Spr_retrado,0,"Yuki")
	  break;
	  
  }
   switch npc_nome{
	  
	  case "Cama":
	  ds_grid_add_text("Minha cama, o lugar onde encontro descanso e paz. Mas estou tendo pesadelos recorrentes com fogo . . . muito fogo.",Spr_retrado,0,"Yuki")
	  break;
	  
   }
   switch npc_nome{
	  
	  case "Poster":
	  ds_grid_add_text("Barvel vs Pc A luta sobre heróis e computadores malignos.",Spr_retrado,0,"Yuki")
	  break;
	  
  }
  // Dentro do seu script Scr_texto

// Dentro do seu script Scr_texto

switch (npc_nome)
{
    // --- NOVO CÓDIGO ADICIONADO ---
    case "Chave":
        // Adiciona a fala e o retrato a serem usados ao apanhar a chave.
        // O nome do "personagem" pode ser "Sistema" ou "Yuki" (para um pensamento).
        ds_grid_add_text("Apanhei a chave do quarto do Tyler.", Spr_retrado, 0, "Yuki");
        break; // Não se esqueça do break!
    // --- FIM DO NOVO CÓDIGO ---

    case "Porta":
        ds_grid_add_text("Está trancado . . .", Spr_retrado, 0, "Yuki");
        ds_grid_add_text("Parece que preciso da chave do quarto do Tyler", Spr_retrado, 0, "Yuki");
        break;
        
    // (Seus outros cases de NPCs continuam aqui)
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