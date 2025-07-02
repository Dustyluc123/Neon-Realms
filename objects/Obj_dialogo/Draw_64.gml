// --- CÓDIGO FINAL E CORRIGIDO para o Evento Draw de Obj_dialogo ---

if (inicializar == true) {
    var _guia = display_get_gui_height();
    var _guil = display_get_gui_width();
    
    // Calcula a posição Y da sua caixa de diálogo
    var _caixa_altura = 200;
    var _caixa_y = _guia - _caixa_altura;
    
    // Lógica de segurança para o sprite do retrato
    var _sprites = undefined;
    if (ds_grid_height(texto_grid) > pagina) {
        _sprites = texto_grid[# infos.Retrato, pagina];
    }
    
    // Pega o texto e configura a fonte
    var _texto = string_copy(texto_grid[# infos.Texto, pagina], 0, carac);
    draw_set_font(fonte_pixe);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // --- LADO ESQUERDO ---
    if (texto_grid[# infos.Lado, pagina] == 0) {
        
        // CÓDIGO ALTERADO: Desenha a sua sprite de diálogo esticada
        draw_sprite_stretched(Spr_dialogo, 0, 200, _caixa_y, _guil - 200, _caixa_altura);
        
        // O resto do código continua igual...
        draw_text(216, _caixa_y - 32, texto_grid[# infos.Nome, pagina]);
        draw_text_ext(232, _caixa_y + 32, _texto, 40, _guil - 264);

        if (sprite_exists(_sprites)) {
            draw_sprite_ext(_sprites, 0, 100, _caixa_y + (_caixa_altura / 2), 3, 3, 0, c_white, 1);
        }
    }
    // --- LADO DIREITO ---
    else { 
        
        // CÓDIGO ALTERADO: Desenha a sua sprite de diálogo esticada
        draw_sprite_stretched(Spr_dialogo, 0, 0, _caixa_y, _guil - 200, _caixa_altura);
        
        // O resto do seu código continua igual...
        var _stgw = string_width(texto_grid[# infos.Nome, pagina]);
        draw_text(_guil - 216 - _stgw, _caixa_y - 32, texto_grid[# infos.Nome, pagina]);
        draw_text_ext(32, _caixa_y + 32, _texto, 40, _guil - 264);

        if (sprite_exists(_sprites)) {
            draw_sprite_ext(_sprites, 0, _guil - 100, _caixa_y + (_caixa_altura / 2), -3, 3, 0, c_white, 1);
        }
    }
}