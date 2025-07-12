// --- CÓDIGO para o Draw GUI de Obj_Inventario_UI ---

// Posição inicial do texto na tela
var _x = 20;
var _y = 50;
var _line_height = 24; // Espaçamento entre as linhas

draw_set_font(fonte_pixe); // Use a sua fonte
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// --- MOSTRAR ARMAS EQUIPADAS ---
var _primaria_nome = "Vazio";
if (instance_exists(global.inventario.arma_primaria)) {
    _primaria_nome = object_get_name(global.inventario.arma_primaria.object_index);
}
draw_text(_x, _y, "1: Primária: " + _primaria_nome);

var _secundaria_nome = "Vazio";
if (instance_exists(global.inventario.arma_secundaria)) {
    _secundaria_nome = object_get_name(global.inventario.arma_secundaria.object_index);
}
draw_text(_x, _y + _line_height, "2: Secundária: " + _secundaria_nome);

// Destaca a arma que está atualmente equipada
var _highlight_y = (_y - 4) + ((global.inventario.arma_equipada_slot - 1) * _line_height);
draw_rectangle(_x - 8, _highlight_y, _x - 4, _highlight_y + 16, false);


// --- MOSTRAR CHAVES ---
_y += _line_height * 3; // Pula algumas linhas
draw_text(_x, _y, "Chaves:");
for (var i = 0; i < array_length(global.inventario.chaves); i++) {
    _y += _line_height;
    draw_text(_x, _y, "- " + global.inventario.chaves[i]);
}