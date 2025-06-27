///OBJ_Dialogo
if inicializar = true{
var _guia = display_get_gui_height()
var _guil = display_get_gui_width()

var _xx = 0
var _yy = _guia - 200;
var _c = c_grey
var _sprites = texto_grid[# infos.Retrato,pagina]
var _texto = string_copy(texto_grid[# infos.Texto,pagina], 0, carac)
draw_set_font(fonte_pixe)
draw_set_halign(fa_left);
draw_set_valign(fa_left);


///lado esquerdo
if texto_grid [# infos.Lado,pagina] == 0{
draw_rectangle_color(_xx + 200, _yy, _guil,_guia, _c, _c, _c, _c, false)

draw_text(_xx + 216,_yy - 32,texto_grid[# infos.Nome, pagina])

draw_text_ext(_xx + 232, _yy + 40,_texto,40, _guil - 264)

draw_sprite_ext(_sprites,0,+3,_guia, 3, 3, 0, c_white, 1)
}
else{///lado direito

draw_rectangle_color(_xx, _yy, _guil - 200,_guia, _c, _c, _c, _c, false)
var _stgw = string_width(texto_grid[# infos.Nome, pagina])

draw_text(_guil - 216 - _stgw,_yy - 32,texto_grid[# infos.Nome, pagina])

draw_text_ext(_xx + 40, _yy + 40 ,_texto,32, _guil - 264)

draw_sprite_ext(_sprites,0,-3,_guia,- 3, 3, 0, c_white, 1)

}
}


