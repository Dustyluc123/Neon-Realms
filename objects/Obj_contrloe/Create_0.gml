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
