// --- CÓDIGO FINAL E COMPLETO para o Evento Step de Obj_Cofre_UI ---

// Permite fechar a interface do cofre com a tecla ESC
if (keyboard_check_pressed(vk_escape)) {
    instance_destroy(); // A lógica de limpeza está no evento Destroy
}

// Lógica do timer para o feedback visual de erro (luz vermelha a piscar)
if (feedback_timer > 0) {
    feedback_timer--;
    if (feedback_timer <= 0) {
        feedback_visual = 0; // Volta ao estado normal
    }
}

// Se um botão foi pressionado (informado pelo evento Draw GUI)...
if (botao_pressionado_valor != noone)
{
    // Guarda o valor do botão numa variável temporária para facilitar a leitura
    var _valor_botao = botao_pressionado_valor;
    
    // --- LÓGICA DO TECLADO ---

    // Se for um NÚMERO e a senha ainda não atingiu o tamanho máximo...
    if (is_string(_valor_botao) && string_length(senha_digitada) < tamanho_max_senha) {
        senha_digitada += _valor_botao;
    }
    // Se for o botão "APAGAR"...
    else if (_valor_botao == "apagar") {
        senha_digitada = ""; // Limpa toda a senha digitada
    }
    // Se for o botão "SAIR"...
    else if (_valor_botao == "sair") {
        instance_destroy(); // Fecha a interface do cofre
    }
    // Se for o botão "ENTER"...
    else if (_valor_botao == "enter") {
        
        // Verifica se a senha digitada é igual à senha correta do cofre
        if (senha_digitada == cofre_alvo.senha_correta) {
     // --- CÓDIGO CORRIGIDO para o Evento Alarm 0 de Obj_Cofre_UI ---

// 1. Abre o documento correto que está guardado no cofre
var _doc = instance_create_layer(0, 0, "Instances_UI", obj_documento_viewer);
_doc.sprite_para_mostrar = cofre_alvo.documento_para_revelar;

// 2. Fecha a interface do cofre
instance_destroy();
instance_destroy();
        }
        else {
            // FALHA!
            feedback_visual = -1; // Ativa a luz vermelha
            feedback_timer = 60; // Faz piscar por 1 segundo
            senha_digitada = ""; // Limpa a senha errada
        }
    }
    
    // Reseta a variável do botão para o próximo frame, para não processar o mesmo clique duas vezes
    botao_pressionado_valor = noone;
}