// --- CÓDIGO COMPLETO E FINAL para o evento STEP de Obj_player ---

// --- Lógica de Dano e Imunidade ---
hit_alpha = lerp(hit_alpha, 0, 0.1);

if (imune == true) {
    hit_alpha = 1;
} else {
    hit_alpha = 0;
}
// Esta linha estava duplicada, removi a segunda.
// hit_alpha = lerp(hit_alpha, 0, 0.3); 

tempo = max(tempo - 1, 0);

// --- Lógica de Morte ---
if (global.life <= 0) {
    game_end();
}

// --- Lógica da Máquina de Estados ---
// Só executa o estado atual (movimento, dash, etc.) se não houver um diálogo na tela.
if (global.dialogo == false) {
    
    // 1. CALCULA O MOVIMENTO INICIAL
    // Esta parte estava dentro do seu script, mas faz mais sentido estar aqui
    // para que possamos modificar hveloc/vveloc antes da colisão.
    if (estado_debuff == "Mind_Control") {
        direita = keyboard_check(ord("A"));
        cima = keyboard_check(ord("S"));
        esquerda = keyboard_check(ord("D"));
        baixo = keyboard_check(ord("W"));
    } else {
        direita = keyboard_check(ord("D"));
        cima = keyboard_check(ord("W"));
        esquerda = keyboard_check(ord("A"));
        baixo = keyboard_check(ord("S"));
    }
    hveloc = (direita - esquerda) * veloc;
    vveloc = (baixo - cima) * veloc;

    // 2. LÓGICA DE BLOQUEIO DO PAI (O PONTO-CHAVE)
    // Se a conversa ainda não aconteceu, verifica se o pai bloqueia o movimento.
    if (global.falou_com_pai == false) {
        if (instance_exists(Obj_nap_pai)) {
            if (place_meeting(x + hveloc, y, Obj_nap_pai)) {
                hveloc = 0;
            }
            if (place_meeting(x, y + vveloc, Obj_nap_pai)) {
                vveloc = 0;
            }
        }
    }
    
    // 3. EXECUTA O ESTADO ATUAL (que agora usa a velocidade já verificada)
    // Inclui a colisão com as paredes e a mudança de sprites.
    script_execute(estado);
}

// --- Lógica de Interação com NPCs ---
if (distance_to_object(Obj_ncp_parent) <= 10) {
    if (keyboard_check_pressed(ord("E")) && global.dialogo == false) {
        var _npc = instance_nearest(x, y, Obj_ncp_parent);
        var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
        _dialogo.npc_nome = _npc.nome;
        // Aqui você provavelmente precisa chamar seu sistema de diálogo, tipo IniciarDialogo()
    }
}