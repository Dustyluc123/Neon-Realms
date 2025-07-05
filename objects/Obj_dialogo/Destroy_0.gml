// --- CÓDIGO FINAL para o Evento Destroy de Obj_dialogo ---

// Avisa o jogo que o diálogo terminou, libertando o jogador.
global.dialogo = false;
draw_set_color(c_white);

// Verificação de segurança para limpar o grid da memória.
if (ds_exists(texto_grid, ds_type_grid))
{
    ds_grid_destroy(texto_grid);
}
