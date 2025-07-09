// --- CÓDIGO ATUALIZADO para o Create de Obj_contrloe ---

// Apague as suas variáveis globais antigas de inventário.

// A nossa nova ficha de inventário completa!
global.inventario = {
    
    // -- Armas --
    arma_primaria: noone, // "noone" significa que o slot está vazio
    arma_secundaria: noone,
    arma_equipada_slot: 1, // 1 para primária, 2 para secundária
    
    armas_na_mochila: [], // Array para guardar as armas que não estão equipadas

    // -- Chaves --
    // O seu sistema de chaves continua igual, mas agora dentro do inventário
    chaves: [], // Substitui o antigo global.inventario_chaves

    // -- Armadura --
    armadura_equipada: "nenhuma"
};

// Exemplo: O jogador começa com uma pistola já equipada no slot primário.
// (Você pode criar esta arma no início do jogo)
global.inventario.arma_primaria = instance_create_layer(x, y, "Instances", Obj_pistol);
with (global.inventario.arma_primaria) {
    // Esconde a arma inicial até que o jogador a use
    visible = false;
    dono = other.id; // Supondo que a arma precise de um "dono"
}