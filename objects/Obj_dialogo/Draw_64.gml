// --- CÓDIGO FINAL E CORRIGIDO para o Evento Draw GUI de Obj_dialogo ---

// Garante que o diálogo só é desenhado depois de inicializado e se houver páginas
if (inicializar == true && ds_grid_height(texto_grid) > pagina) 
{
    // Pega o tipo da linha atual para decidir o que fazer
    var _tipo_da_linha = texto_grid[# 5, pagina];

    // --- SE FOR UMA LINHA DE FALA NORMAL ---
    if (_tipo_da_linha == "fala")
    {
        // --- 1. CONFIGURAÇÃO VISUAL ---
        var _margem_inicio_esq = 345; 
        var _largura_max_esq = display_get_gui_width() - 402;
        var _margem_inicio_dir = 112; 
        var _largura_max_dir = display_get_gui_width() - 436;
        var _posicao_y_texto = 32;

        // --- 2. Pega os dados e desenha ---
        var _texto = texto_grid[# 0, pagina];
        var _retrato = texto_grid[# 1, pagina];
        var _lado = texto_grid[# 2, pagina];
        var _nome = texto_grid[# 3, pagina];
        var _caixa_sprite = texto_grid[# 4, pagina];
        
        var _guia = display_get_gui_height();
        var _guil = display_get_gui_width();
        var _caixa_altura = 200;
        var _caixa_y = _guia - _caixa_altura;
        
        draw_set_font(fonte_pixe);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        var _texto_para_mostrar = string_copy(_texto, 1, carac);

        if (_lado == 0) { // Lado Esquerdo
            if (sprite_exists(_caixa_sprite)) {
                 draw_sprite_stretched(_caixa_sprite, 0, 200, _caixa_y, _guil - 200, _caixa_altura);
            }
            draw_text(216, _caixa_y - 32, _nome);
            draw_text_ext(_margem_inicio_esq, _caixa_y + _posicao_y_texto, _texto_para_mostrar, 40, _largura_max_esq);
            if (sprite_exists(_retrato)) {
                draw_sprite_ext(_retrato, 0, 100, _caixa_y + (_caixa_altura / 2), 3, 3, 0, c_white, 1);
            }
        } else { // Lado Direito
            if (sprite_exists(_caixa_sprite)) {
                draw_sprite_stretched(_caixa_sprite, 0, 0, _caixa_y, _guil - 200, _caixa_altura);
            }
            var _stgw = string_width(_nome);
            draw_text(_guil - 216 - _stgw, _caixa_y - 32, _nome);
            draw_text_ext(_margem_inicio_dir, _caixa_y + _posicao_y_texto, _texto_para_mostrar, 40, _largura_max_dir);
            if (sprite_exists(_retrato)) {
                draw_sprite_ext(_retrato, 0, _guil - 100, _caixa_y + (_caixa_altura / 2), -3, 3, 0, c_white, 1);
            }
        }
    }
    // --- SE FOR UMA LINHA DE ESCOLHA ---
    else if (_tipo_da_linha == "escolha")
    {
        // Pega os dados da linha de escolha
        var _caixa_sprite = texto_grid[# 4, pagina]; // Usa a caixa de diálogo definida
        var _opcoes = texto_grid[# 6, pagina];
        
        // Desenha a caixa de diálogo
        var _guil = display_get_gui_width();
        var _guia = display_get_gui_height();
        var _caixa_altura = 200;
        var _caixa_y = _guia - _caixa_altura;
        if (sprite_exists(_caixa_sprite)) {
            draw_sprite_stretched(_caixa_sprite, 0, 0, _caixa_y, _guil, _caixa_altura);
        }
        
        // Desenha as opções de texto na tela
        draw_set_font(fonte_pixe);
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);
        
        for (var i = 0; i < array_length(_opcoes); i++) {
            var _texto_opcao = _opcoes[i].texto;
            
            if (i == opcao_selecionada) {
                draw_set_color(c_yellow);
                _texto_opcao = "> " + _texto_opcao;
            } else {
                draw_set_color(c_white);
            }
            
            // CORREÇÃO: Usa as coordenadas da caixa para desenhar o texto
            var _texto_x = 50; // Margem da esquerda
            var _texto_y = _caixa_y + 40 + (i * 45); // Posição Y com espaçamento
            
            draw_text(_texto_x, _texto_y, _texto_opcao);
        }
        draw_set_color(c_white); // Reseta a cor para o padrão
    }
}