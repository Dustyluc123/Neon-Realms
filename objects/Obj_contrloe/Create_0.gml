// --- CÓDIGO CREATE FINAL E CORRIGIDO para Obj_contrloe ---

// Garante que só existe uma instância deste objeto no jogo
if (instance_number(object_index) > 1) 
{
    instance_destroy();
    exit; 
}

// Torna este objeto "imortal"
persistent = true;

// A sua estrutura de inventário
global.inventario = {
    arma_primaria: noone,
    arma_secundaria: noone,
    arma_equipada_slot: 1,
    armas_na_mochila: [],
    chaves: [],
    armadura_equipada: "nenhuma"
};

// Variáveis para a posição de spawn do jogador
global.proximo_player_x = noone;
global.proximo_player_y = noone;

// Variável para a cutscene do pai
global.falou_com_pai = false;

// Variável para o estado de diálogo
global.dialogo = false;

// --- LINHA QUE FALTAVA (A CORREÇÃO ESTÁ AQUI) ---
// Declara a variável global para saber se uma cutscene está ativa
global.em_cutscene = false;