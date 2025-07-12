// Garante que só existe uma instância
if (instance_number(object_index) > 1) { instance_destroy(); exit; }
persistent = true;

// A nossa nova ficha de inventário completa!
global.inventario = {
    arma_primaria: noone,
    arma_secundaria: noone,
    arma_equipada_slot: 1,
    armas_na_mochila: [],
    chaves: [],
    armadura_equipada: "nenhuma"
};

// --- Outras Variáveis Globais ---
global.proximo_player_x = noone;
global.proximo_player_y = noone;
global.falou_com_pai = false;
global.dialogo = false;
global.em_cutscene = false;

// Exemplo: O jogador começa com uma pistola já equipada no slot primário.
// Você pode remover ou alterar esta parte se o jogador começar desarmado.
var _arma_inicial = instance_create_layer(0, 0, "Instances", Obj_pistol);
_arma_inicial.visible = false; // A arma fica invisível até ser usada
global.inventario.arma_primaria = _arma_inicial;