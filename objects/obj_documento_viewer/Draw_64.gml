// --- Evento Draw GUI de obj_documento_viewer ---

// Pega as dimensões da tela
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// Desenha um fundo preto semi-transparente para focar no documento
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, _gui_w, _gui_h, false);
draw_set_alpha(1.0); // Reseta a transparência para os próximos desenhos

// Desenha o sprite do documento no centro da tela
if (sprite_exists(sprite_para_mostrar))
{
	draw_sprite(sprite_para_mostrar, 0, _gui_w / 2, _gui_h / 2);
}

// Desenha o botão de fechar no canto superior direito do documento
var _doc_w = sprite_get_width(sprite_para_mostrar);
var _doc_h = sprite_get_height(sprite_para_mostrar);
var _botao_x = (_gui_w / 2) + (_doc_w / 2);
var _botao_y = (_gui_h / 2) - (_doc_h / 2);
draw_sprite(spr_botao_fechar, 0, _botao_x, _botao_y);