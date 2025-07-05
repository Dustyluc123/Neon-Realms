// --- CÓDIGO FINAL E COMPLETO para o Evento Draw GUI de Obj_dialogo ---

// Garante que o diálogo só é desenhado depois de inicializado e se houver páginas
if (inicializar == true && ds_grid_height(texto_grid) > pagina) 
{
    // --- 1. PAINEL DE CONTROLO VISUAL (AQUI VOCÊ PODE MUDAR TUDO) ---

    // Posição do NOME para o LADO ESQUERDO (retrato na esquerda)
    var _nome_x_esq = 48;
    var _nome_y_esq = -32; // Negativo para ficar acima da caixa

    // Posição do NOME para o LADO DIREITO (retrato na direita)
    var _nome_x_dir = -48; // Offset a partir da direita
    var _nome_y_dir = -32;

    // As suas variáveis de personalização do TEXTO (mantidas)
    var _margem_inicio_esq = 345; 
    var _largura_max_esq = display_get_gui_width() - 402;
    var _margem_inicio_dir = 112; 
    var _largura_max_dir = display_get_gui_width() - 436;
    var _posicao_y_texto = 32;

    // Posição e espaçamento das ESCOLHAS
    var _escolhas_x_offset = 600; // Margem da esquerda dentro da caixa
    var _escolhas_y_inicio = 25; // Margem do topo dentro da caixa
    var _escolhas_espacamento = 45; // Espaço vertical entre cada opção

    // --- FIM DO PAINEL DE CONTROLO ---


    // --- 2. Pega os dados da linha de diálogo atual ---
    var _tipo_da_linha = texto_grid[# 5, pagina];
    var _retrato = texto_grid[# 1, pagina];
    var _lado = texto_grid[# 2, pagina];
    var _caixa_sprite = texto_grid[# 4, pagina];
    var _nome = texto_grid[# 3, pagina];

    // --- 3. Calcula as posições base e desenha os elementos comuns ---
    var _guil = display_get_gui_width();
    var _guia = display_get_gui_height();
    var _caixa_altura = 200;
    var _caixa_y = _guia - _caixa_altura;

    if (_lado == 0) { // Retrato à Esquerda
        if (sprite_exists(_caixa_sprite)) {
             draw_sprite_stretched(_caixa_sprite, 0, 200, _caixa_y, _guil - 200, _caixa_altura);
        }
        if (sprite_exists(_retrato)) {
            draw_sprite_ext(_retrato, 0, 100, _caixa_y + (_caixa_altura / 2), 3, 3, 0, c_white, 1);
        }
        draw_set_halign(fa_left);
        draw_text(_nome_x_esq, _caixa_y + _nome_y_esq, _nome);
    } else { // Retrato à Direita
        if (sprite_exists(_caixa_sprite)) {
            draw_sprite_stretched(_caixa_sprite, 0, 0, _caixa_y, _guil - 200, _caixa_altura);
        }
        if (sprite_exists(_retrato)) {
            draw_sprite_ext(_retrato, 0, _guil - 100, _caixa_y + (_caixa_altura / 2), -3, 3, 0, c_white, 1);
        }
        var _stgw = string_width(_nome);
        draw_set_halign(fa_right);
        draw_text(_guil + _nome_x_dir, _caixa_y + _nome_y_dir, _nome);
    }

    // --- 4. Desenha o Conteúdo Específico (Fala ou Escolhas) ---
    draw_set_font(fonte_pixe);
    draw_set_valign(fa_top);
    draw_set_color(c_white);

    // SE FOR UMA FALA NORMAL...
    if (_tipo_da_linha == "fala")
    {
        var _texto = texto_grid[# 0, pagina];
        var _texto_para_mostrar = string_copy(_texto, 1, carac);
        
        if (_lado == 0) {
            draw_set_halign(fa_left);
            draw_text_ext(_margem_inicio_esq, _caixa_y + _posicao_y_texto, _texto_para_mostrar, 40, _largura_max_esq);
        } else {
            draw_set_halign(fa_left);
            draw_text_ext(_margem_inicio_dir, _caixa_y + _posicao_y_texto, _texto_para_mostrar, 40, _largura_max_dir);
        }
    }
       else if (_tipo_da_linha == "escolha")
    {
        // Pega os dados da linha de escolha
        var _opcoes = texto_grid[# 6, pagina];
        
        // Desenha a caixa de diálogo
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
            
          draw_text(_escolhas_x_offset, _caixa_y + _escolhas_y_inicio + (i * _escolhas_espacamento), _texto_opcao);
        }
        draw_set_color(c_white); // Reseta a cor para o padrão
    }
}