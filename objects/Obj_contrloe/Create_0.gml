// --- CÓDIGO ATUALIZADO para o Create de Obj_contrloe ---

// Garante que só existe uma instância deste objeto no jogo
if (instance_number(object_index) > 1) {
    instance_destroy();
    exit; 
}

// Torna este objeto "imortal"
persistent = true;

// A nossa nova ficha de inventário completa!
global.inventario = {
    
    // -- Armas --
    arma_primaria: noone,       // "noone" significa que o slot está vazio. Guarda o ID da instância da arma.
    arma_secundaria: noone,
    arma_equipada_slot: 1,      // 1 para primária, 2 para secundária. O jogador começa com a primária.
    
    armas_na_mochila: [],       // Array para guardar os TIPOS de arma (ex: Obj_pistol) que não estão equipadas.

    // -- Chaves --
    // O seu sistema de chaves continua igual, mas agora dentro do inventário.
    chaves: [],                 // Substitui o antigo global.inventario_chaves.

    // -- Armadura --
    armadura_equipada: "nenhuma" // Slot para a sua futura armadura.
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