// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_texto(){

  // --- CÓDIGO CORRIGIDO para o seu switch no Scr_texto ---

    // --- Diálogo do Tyler ---
// --- CÓDIGO FINAL E UNIFICADO para o seu Scr_texto ---

// A sua função ds_grid_add_text e o enum infos devem estar aqui ou num script global

switch (npc_nome)
{
    // --- DIÁLOGOS DOS PERSONAGENS ---
    case "Tyler":
        ds_grid_add_text("Graças a Deus acordou dorminhoco, você disse que gostaria de ir a academia de polícia comigo hoje não é? ", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("Eu só não sabia que teria que acordar tão cedo...", Spr_retrado_yuki_sono, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Bem vindo ao mundo adulto garoto. Bem pegue seu crachá de acompanhante e vamos sair, vou te esperar lá fora.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("Ah... Ok, onde você deixou?", Spr_retrado_yuki_sono, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Não lembro hahaha, é bom que você pode dar uma rodada pela casa.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("É como eu sempre digo, conheça seu lar e conhecerá todo o universo.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("Essa frase nem faz sentido pai.", Spr_retrado_yuki_surpreso, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Hahaha. Falando em frases que não fazem sentido. Uma conhecida sempre me dizia que voce pode clicar E para interagir, eu nunca entendi o que significa, mas que tal você dar uma 'interagida' pela casa em filho?", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("É... a gente não tava com pressa?", Spr_retrado_yuki_surpreso, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Eu nuca chego no horário mesmo. ", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text(". . . que?", Spr_retrado_yuki_surpreso, 0, "Yuki", Spr_dialogo);
        break;

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

    // --- INTERAÇÕES COM OBJETOS ---
    case "Espelho":
        ds_grid_add_text("Por algum motivo eu não consigo me ver nessas coisas, parece preguiça do criador eu não me ver nisso. Talvez eu seja um vampiro", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;

    case "Cama":
        ds_grid_add_text("Minha cama, o lugar onde encontro descanso e paz. Mas estou tendo pesadelos recorrentes com fogo . . . muito fogo.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;

    case "Poster":
        ds_grid_add_text("Barvel vs Pc A luta sobre heróis e computadores malignos.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;

    // --- DIÁLOGOS DO SISTEMA ---
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
// Exemplo de como a sua função deve ficar
function ds_grid_add_text(_texto, _retrato, _lado, _nome, _caixa_sprite) {
    var _linha = ds_grid_height(texto_grid);
    texto_grid[# infos.Texto, _linha] = _texto;
    texto_grid[# infos.Retrato, _linha] = _retrato;
    texto_grid[# infos.Lado, _linha] = _lado;
    texto_grid[# infos.Nome, _linha] = _nome;
    texto_grid[# infos.CaixaDeDialogo, _linha] = _caixa_sprite; // <<< NOVA LINHA
}
