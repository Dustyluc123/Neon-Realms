// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_texto(){

  switch npc_nome{
	  
	  case "Tyler":
	  
	    ds_grid_add_text("Graças a Deus acordou dorminhoco, você disse que gostaria de ir a academia de polícia comigo hoje não é? ", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("Eu só não sabia que teria que acordar tão cedo...", Spr_retrado_yuki_sono, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Bem vindo ao mundo adulto garoto. Bem pegue seu crachá de acompanhante e vamos sair, vou te esperar lá fora.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("Ah... Ok, onde você deixou?", Spr_retrado_yuki_sono, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Não lembro hahaha, é bom que você pode dar uma rodada pela casa.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("É como eu sempre digo, conheça seu lar e conhecerá todo o universo.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("Essa frase nem faz sentido pai.", Spr_retrado_yuki_surpreso, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Hahaha. Falando em frases que não fazem sentido. Uma conhecida sempre me dizia que voce pode clicar E para interagir, eu nunca entendi o que significa.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
		ds_grid_add_text("Mas que tal você dar uma 'interagida' pela casa em filho?", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("É... a gente não tava com pressa?", Spr_retrado_yuki_surpreso, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Eu nuca chego no horário mesmo. ", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text(". . . que?", Spr_retrado_yuki_surpreso, 0, "Yuki", Spr_dialogo);
        break;
	 
  }
   switch npc_nome{
	  
	  case "Elisa":
        ds_grid_add_text("Bom dafeasfdgia", Spr_retrado_yuki_normal, 0, "personagem 1", Spr_dialogo);
        ds_grid_add_text("Eae bsergfhom dia.", Spr_retrado_tyler_normal, 1, "Car", Spr_dialogo_1);
        ds_grid_add_text("O que asdgfngrdgfnhtemos para hoje?", Spr_retrado_yuki_normal, 0, "personagem 1", Spr_dialogo);
        ds_grid_add_text("Treino desdfe tiro ao alvo", Spr_retrado_tyler_normal, 1, "Car", Spr_dialogo_1);
        break;

    case "sa":
        ds_grid_add_text("Boia", Spr_retrado_yuki_normal, 0, "personagem 1", Spr_dialogo);
        ds_grid_add_text("Eae m dia.", Spr_retrado_tyler_normal, 1, "Car", Spr_dialogo_1);
        ds_grid_add_text("O que asdgfngrdgfnhtemos para hoje?", Spr_retrado_yuki_normal, 0, "personagem 1", Spr_dialogo);
        ds_grid_add_text("Trero ao alvo", Spr_retrado_tyler_normal, 1, "Car", Spr_dialogo_1);
        break;
	  
  }
     switch npc_nome{
	  case "Espelho":
        ds_grid_add_text("Por algum motivo eu não consigo me ver nessas coisas, parece preguiça do criador eu não me ver nisso. Talvez eu seja um vampiro", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;	  
  }
   switch npc_nome{
	  
case "Cama":
        ds_grid_add_text("Minha cama, o lugar onde encontro descanso e paz. Mas estou tendo pesadelos recorrentes com fogo . . . muito fogo.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;
   }
   switch npc_nome{
	  
	    case "Poster":
        ds_grid_add_text("Barvel vs Pc A luta sobre heróis e computadores malignos.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;

	  
  }
  // Dentro do seu script Scr_texto

// Dentro do seu script Scr_texto

switch (npc_nome)
{
  
  case "porta_tyler_trancada":
        ds_grid_add_text("Está trancado...", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Preciso da chave do quarto do Tyler.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;
        
    case "porta_saida_trancada":
        ds_grid_add_text("A porta da frente está trancada.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Preciso de encontrar a chave para sair.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;
        
    case "apanhei_chave_tyler":
        ds_grid_add_text("Apanhei a chave do quarto do Tyler.", Spr_retrado_yuki_normal, 0, "Sistema", Spr_dialogo);
        break;
        
    case "apanhei_chave_casa":
        ds_grid_add_text("Esta deve ser a chave da porta da frente.", Spr_retrado_yuki_normal, 0, "Sistema", Spr_dialogo);
        break;
}


}
function ds_grid_add_row(){
	///@arg ds_grid
 
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);	
}
// --- CÓDIGO ATUALIZADO para a função ds_grid_add_text no seu Scr_texto ---

function ds_grid_add_text(){
	///@arg texto
	///@arg retrato
	///@arg lado
	///@arg nome
    ///@arg caixa_sprite  // <<< NOVO ARGUMENTO
 
	var _grid = texto_grid;
	var _y = ds_grid_add_row(_grid);
 
	_grid[# 0, _y] = argument[0]; // Texto
	_grid[# 1, _y] = argument[1]; // Retrato
	_grid[# 2, _y] = argument[2]; // Lado
	_grid[# 3, _y] = argument[3]; // Nome
    _grid[# 4, _y] = argument[4]; // <<< NOVA LINHA: Guarda a sprite da caixa de diálogo
}