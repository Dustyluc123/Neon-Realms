// --- CÓDIGO FINAL E CORRIGIDO para o Evento Draw GUI de Obj_Cofre_UI ---

// --- Parte 1: Desenhar a Interface Base (seu código original) ---
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1.0);

// draw_sprite(spr_interface_cofre, 0, teclado_x, teclado_y);

// --- Parte 2: Desenhar o Display e o Feedback (seu código original) ---
draw_set_font(fonte_pixe);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_lime);
var _display_text = string_repeat("*", string_length(senha_digitada));
draw_text(teclado_x, teclado_y - 100, _display_text);

if (feedback_visual == 1) {
    draw_sprite(spr_luz_verde, 0, teclado_x + 80, teclado_y - 100);
} else if (feedback_visual == -1) {
    if (floor(feedback_timer / 6) mod 2 == 0) {
        draw_sprite(spr_luz_vermelha, 0, teclado_x + 80, teclado_y - 100);
    }
}


// --- Parte 3: Desenhar os Botões e Detetar o Clique (COM A CORREÇÃO FINAL) ---

// Verifica se o jogador clicou com o mouse
if (mouse_check_button_pressed(mb_left) && feedback_timer <= 0)
{
    // Pega a posição do mouse na GUI da forma mais segura
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    // Percorre a nossa lista de botões para ver se algum foi clicado
    for (var i = 0; i < array_length(lista_de_botoes); i++)
    {
        var _btn = lista_de_botoes[i];
        
        // --- CÁLCULO MANUAL DE COLISÃO ---
        // Pega a largura e a altura do sprite do botão
        var _w = sprite_get_width(_btn.sprite_index);
        var _h = sprite_get_height(_btn.sprite_index);
        
        // Pega os quatro cantos do botão
        var _left = _btn.x - (_w / 2);
        var _right = _btn.x + (_w / 2);
        var _top = _btn.y - (_h / 2);
        var _bottom = _btn.y + (_h / 2);
        
        // Verifica se o mouse está dentro deste retângulo
        if (_mx > _left && _mx < _right && _my > _top && _my < _bottom)
        {
            // Se foi clicado, guarda o valor dele e avisa o evento Step
            botao_pressionado_valor = _btn.valor;
            break; // Sai do loop, já encontrámos o botão clicado
        }
    }
}

// Finalmente, desenha cada botão na tela
for (var i = 0; i < array_length(lista_de_botoes); i++)
{
    var _btn = lista_de_botoes[i];
    
    // Desenha o sprite do botão
    draw_sprite(spr_botao_teclado, 0, _btn.x, _btn.y);
    
    // Desenha o número ou símbolo em cima do botão
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text(_btn.x, _btn.y, _btn.valor);
}