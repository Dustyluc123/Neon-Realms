///OBJ_HUD


var porcentajesalud = health / 100;
 porcentajesalud = ceil(health / 100 *global.life)
 

for (var i = 0;i<porcentajesalud;i++){
     draw_sprite(Spr_coracao, 0, 16 + 32 * i, 32)
}


/// @description Desenha o HUD de armas do jogador, com destaque atrás e centralizado.

// --- Posição do HUD na tela ---
var _gui_h = display_get_gui_height(); 
var _hud_x = 50; // Aumentei um pouco para dar mais espaço da borda
var _hud_y = _gui_h - 50; // Posição Y (embaixo)
var _espaco_entre_slots = 68; // Espaço entre os quadrados

// --- Informações do Inventário ---
var _arma1 = global.inventario.arma_primaria;
var _arma2 = global.inventario.arma_secundaria;
var _slot_ativo = global.inventario.arma_equipada_slot;

// --- Desenhar Slot da Arma 1 ---
var _slot1_x = _hud_x;
var _slot1_y = _hud_y;

// 1. Desenha o destaque PRIMEIRO, se o slot estiver ativo
if (_slot_ativo == 1) {
    draw_sprite(spr_hud_slot_selecionado, 0, _slot1_x, _slot1_y);
}

// 2. Desenha o fundo do slot DEPOIS, por cima do destaque
draw_sprite(spr_hud_slot, 0, _slot1_x, _slot1_y);

// 3. Desenha a arma por último, usando as mesmas coordenadas do slot
// Como a origem de ambos está no centro, eles ficarão perfeitamente alinhados.
if (_arma1 != noone) {
    var _id_arma1 = _arma1.weapon_id;
    var _sprite_arma1 = Obj_armas.armas[_id_arma1][? "sprite"];
    draw_sprite(_sprite_arma1, 0, _slot1_x, _slot1_y);
}

// --- Desenhar Slot da Arma 2 ---
var _slot2_x = _hud_x + _espaco_entre_slots;
var _slot2_y = _hud_y;

// 1. Desenha o destaque PRIMEIRO
if (_slot_ativo == 2) {
    draw_sprite(spr_hud_slot_selecionado, 0, _slot2_x, _slot2_y);
}

// 2. Desenha o fundo do slot DEPOIS
draw_sprite(spr_hud_slot, 0, _slot2_x, _slot2_y);

// 3. Desenha a arma por último, perfeitamente centralizada
if (_arma2 != noone) {
    var _id_arma2 = _arma2.weapon_id;
    var _sprite_arma2 = Obj_armas.armas[_id_arma2][? "sprite"];
    draw_sprite(_sprite_arma2, 0, _slot2_x, _slot2_y);
}
