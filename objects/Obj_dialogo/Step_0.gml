// --- CÓDIGO FINAL E CORRIGIDO para o Evento Step de Obj_dialogo ---

// --- BLOCO DE INICIALIZAÇÃO E RECARREGAMENTO ---
// Este bloco tem prioridade máxima e é executado primeiro.
if (inicializar == false || precisa_recarregar == true)
{
    ds_grid_resize(texto_grid, 7, 0); 
    script_execute(Scr_texto);
    
    if (ds_grid_height(texto_grid) == 0) {
        instance_destroy();
        exit;
    }

    pagina = 0;
    carac = 0;
    opcao_selecionada = 0;
    mostrando_escolhas = (texto_grid[# 5, 0] == "escolha");
    
    inicializar = true;
    precisa_recarregar = false;
    
    exit; 
}


// --- BLOCO DE LÓGICA DO JOGADOR ---
// Este código só é executado se o diálogo já estiver carregado e estável.

// Se estivermos a mostrar escolhas...
if (mostrando_escolhas == true)
{
    // Lógica para NAVEGAR nas opções com as teclas W e S
    var _subir = keyboard_check_pressed(ord("W"));
    var _descer = keyboard_check_pressed(ord("S"));
    var _opcoes = texto_grid[# 6, pagina];
    
    opcao_selecionada += (_descer - _subir);
    opcao_selecionada = clamp(opcao_selecionada, 0, array_length(_opcoes) - 1);
    
    // Lógica para SELECIONAR uma opção com 'E' ou clique esquerdo
    var _selecionou = mouse_check_button_pressed(mb_left);
    if (_selecionou) {
        var _alvo = _opcoes[opcao_selecionada].alvo;
        
        npc_nome = _alvo;
        precisa_recarregar = true;
    }
}
// Se estivermos a mostrar uma FALA NORMAL...
else 
{
    // Efeito "máquina de escrever"
    var _texto_completo = texto_grid[# 0, pagina];
    if (carac < string_length(_texto_completo)) {
        carac += 0.5;
    }

    // Avançar com o botão DIREITO do mouse
    if (mouse_check_button_pressed(mb_left)) {
        // Se o texto ainda estava a ser escrito, completa-o
        if (carac < string_length(_texto_completo)) {
            carac = string_length(_texto_completo);
        } 
        // Se o texto já estava completo, decide se avança a página ou fecha o diálogo
        else {
            // Se esta NÃO é a última página...
            if (pagina < ds_grid_height(texto_grid) - 1) {
                pagina += 1;
                carac = 0;
                // Verifica se a NOVA página é uma linha de escolha
                if (texto_grid[# 5, pagina] == "escolha") {
                    mostrando_escolhas = true;
                }
            } 
            // Se esta É a última página...
            else {
                instance_destroy();
            }
        }
    }
}