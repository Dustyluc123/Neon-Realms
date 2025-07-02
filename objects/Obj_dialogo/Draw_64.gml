// --- CÓDIGO FINAL E CORRIGIDO para o Evento Draw GUI de Obj_dialogo ---

// Garante que o diálogo só é desenhado depois de inicializado e se houver páginas
if (inicializar == true && ds_grid_height(texto_grid) > pagina) 
{
    // --- 1. CONFIGURAÇÃO VISUAL (AQUI VOCÊ PODE MUDAR TUDO) ---

    // --- Configurações para o LADO ESQUERDO (Retrato na Esquerda) ---
    var _margem_inicio_esq = 345; 
    var _largura_max_esq = display_get_gui_width() - 402;
    
    // --- Configurações para o LADO DIREITO (Retrato na Direita) ---
    // Para o texto começar "mais para a frente", AUMENTE este valor.
    var _margem_inicio_dir = 112; 
    
    // Para a quebra de linha acontecer "mais cedo", AUMENTE o número depois do sinal de menos (-).
    var _largura_max_dir = display_get_gui_width() - 436;

    // Posição vertical do texto (geralmente a mesma para os dois lados)
    var _posicao_y_texto = 32;

    // --- FIM DA CONFIGURAÇÃO ---


    // --- 2. Pega os dados da linha de diálogo atual ---
    var _texto = texto_grid[# 0, pagina];
    var _retrato = texto_grid[# 1, pagina];
    var _lado = texto_grid[# 2, pagina];
    var _nome = texto_grid[# 3, pagina];
    var _caixa_sprite = texto_grid[# 4, pagina];

    // --- 3. Calcula as posições base ---
    var _guia = display_get_gui_height();
    var _guil = display_get_gui_width();
    var _caixa_altura = 200;
    var _caixa_y = _guia - _caixa_altura;
    
    // Configurações da fonte
    draw_set_font(fonte_pixe);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // Efeito "máquina de escrever"
    var _texto_para_mostrar = string_copy(_texto, 1, carac);

    // --- 4. Desenha com base no LADO, usando as novas variáveis ---
    
    // --- LADO ESQUERDO (Retrato à esquerda) ---
    if (_lado == 0) {
        
        if (sprite_exists(_caixa_sprite)) {
             draw_sprite_stretched(_caixa_sprite, 0, 200, _caixa_y, _guil - 200, _caixa_altura);
        }
        
        draw_text(216, _caixa_y - 32, _nome);
        draw_text_ext(_margem_inicio_esq, _caixa_y + _posicao_y_texto, _texto_para_mostrar, 40, _largura_max_esq);

        if (sprite_exists(_retrato)) {
            draw_sprite_ext(_retrato, 0, 100, _caixa_y + (_caixa_altura / 2), 3, 3, 0, c_white, 1);
        }
    }
    // --- LADO DIREITO (Retrato à direita) ---
    else { 
        
        if (sprite_exists(_caixa_sprite)) {
            draw_sprite_stretched(_caixa_sprite, 0, 0, _caixa_y, _guil - 200, _caixa_altura);
        }
        
        var _stgw = string_width(_nome);
        draw_text(_guil - 216 - _stgw, _caixa_y - 32, _nome);
        
        // CORREÇÃO APLICADA AQUI: Usa a variável de configuração para o lado direito
        draw_text_ext(_margem_inicio_dir, _caixa_y + _posicao_y_texto, _texto_para_mostrar, 40, _largura_max_dir);

        if (sprite_exists(_retrato)) {
            draw_sprite_ext(_retrato, 0, _guil - 100, _caixa_y + (_caixa_altura / 2), -3, 3, 0, c_white, 1);
        }
    }
}