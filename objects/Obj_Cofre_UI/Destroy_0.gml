// Limpa tudo ao fechar a UI
global.em_cutscene = false;
with (Obj_Botao_Teclado) {
    instance_destroy();
}
draw_set_color(c_white);