// --- CÓDIGO COMPLETO E CORRIGIDO para o Evento Step de obj_documento_viewer ---

// Condição para fechar com o teclado (apertar 'E' ou 'ESC')
if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_escape))
{
    instance_destroy(); // Fecha a janela do documento
}

// Condição para fechar clicando no botão "X"
if (mouse_check_button_pressed(mb_left))
{
    // --- Esta parte calcula a posição do botão "X" na tela ---
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _doc_w = sprite_get_width(sprite_para_mostrar);
    var _doc_h = sprite_get_height(sprite_para_mostrar);
    var _botao_x_gui = (_gui_w / 2) + (_doc_w / 2);
    var _botao_y_gui = (_gui_h / 2) - (_doc_h / 2);
    
    // --- Esta parte pega a posição atual do mouse na tela ---
    // Usamos device_mouse... para funcionar corretamente no Evento Step
    var _mouse_x_na_gui = device_mouse_x_to_gui(0);
    var _mouse_y_na_gui = device_mouse_y_to_gui(0);

    // --- Esta parte verifica se o clique do mouse foi na área do botão ---
    // A função point_in_circle cria uma área de clique circular invisível
    if (point_in_circle(_mouse_x_na_gui, _mouse_y_na_gui, _botao_x_gui, _botao_y_gui, 24)) 
    {
        instance_destroy(); // Se o clique foi no botão, fecha a janela
    }
}