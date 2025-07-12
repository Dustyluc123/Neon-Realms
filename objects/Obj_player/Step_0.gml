// --- CÓDIGO FINAL E COMPLETO para o evento STEP de Obj_player ---

// --- Lógica que roda sempre (vida, dano, tempo, etc.) ---
hit_alpha = lerp(hit_alpha, 0, 0.1);
if (global.life <= 0) { game_end(); }
if (imune == true) { hit_alpha = 1; } else { hit_alpha = 0; }
tempo = max(tempo - 1, 0);

// --- Garante que a arma equipada está sempre sincronizada ---
// Se a arma atual não existir (foi largada, por exemplo), atualiza para a próxima disponível.
if (!instance_exists(my_weapon)) {
    weapon_update_equipped();
}

// --- Ações do jogador (movimento, troca de armas, etc.) ---
// Só executa se não houver diálogo ou cutscene.
if (global.dialogo == false && global.em_cutscene == false) 
{
    // Executa o estado atual (andando, dash, etc.), que controla o movimento.
    script_execute(estado);

    // --- Lógica de Troca de Armas (teclas 1 e 2) ---
    var _trocar_para_1 = keyboard_check_pressed(ord("1"));
    var _trocar_para_2 = keyboard_check_pressed(ord("2"));

    if (_trocar_para_1 && global.inventario.arma_primaria != noone) {
        global.inventario.arma_equipada_slot = 1;
        weapon_update_equipped(); // Atualiza a arma imediatamente
    }
    if (_trocar_para_2 && global.inventario.arma_secundaria != noone) {
        global.inventario.arma_equipada_slot = 2;
        weapon_update_equipped(); // Atualiza a arma imediatamente
    }
}

// --- Lógica de Interação Unificada (tecla 'E') ---
var _distancia_interacao = 48;

// Só permite interagir se não estiver em diálogo ou cutscene.
if (keyboard_check_pressed(ord("E")) && !instance_exists(Obj_dialogo) && !global.em_cutscene) 
{
    // --- Prioridade 1: Tenta Apanhar uma Arma ---
    var _arma_perto = instance_nearest(x, y, Obj_weapon_drop);
    if (_arma_perto != noone && distance_to_object(_arma_perto) < _distancia_interacao) {
        weapon_pickup();
        exit; // Interagiu, não faz mais nada neste frame.
    }

    // --- Prioridade 2: Tenta Interagir com o Cofre ---
    var _cofre_perto = instance_nearest(x, y, Obj_Cofre);
    if (_cofre_perto != noone && distance_to_object(_cofre_perto) < _distancia_interacao) {
        if (!instance_exists(Obj_Cofre_UI)) {
            var _ui = instance_create_layer(0, 0, "Instances_UI", Obj_Cofre_UI);
            _ui.cofre_alvo = _cofre_perto;
        }
        exit;
    }

    // --- Prioridade 3: Tenta Interagir com uma Chave ---
    var _chave_perto = instance_nearest(x, y, Obj_Chave);
    if (_chave_perto != noone && distance_to_object(_chave_perto) < _distancia_interacao) {
        var _dialogo_para_mostrar = _chave_perto.dialogo_ao_apanhar;
        array_push(global.inventario.chaves, _chave_perto.nome_da_chave);
        instance_destroy(_chave_perto);
        var _dialogo_chave = instance_create_layer(x, y, "dialogo", Obj_dialogo);
        _dialogo_chave.npc_nome = _dialogo_para_mostrar;
        exit;
    }

    // --- Prioridade 4: Tenta Interagir com uma Porta ---
    var _porta_perto = instance_nearest(x, y, Obj_Porta_Trancavel);
    if (_porta_perto != noone && distance_to_object(_porta_perto) < _distancia_interacao) {
        if (_porta_perto.trancada) {
            var _tem_a_chave = array_contains(global.inventario.chaves, _porta_perto.chave_necessaria);
            if (_tem_a_chave) {
                _porta_perto.trancada = false;
                switch (_porta_perto.acao_ao_abrir) {
                    case "destruir_objetos":
                        with (Obj_quarto_escuro) instance_destroy();
                        with (Obj_colisao_porta_tyler) instance_destroy();
                        break;
                    case "mudar_de_sala":
                        global.proximo_player_x = _porta_perto.target_x;
                        global.proximo_player_y = _porta_perto.target_y;
                        room_goto(_porta_perto.sala_de_destino);
                        break;
                }
            } else {
                var _dialogo_porta = instance_create_layer(x, y, "dialogo", Obj_dialogo);
                _dialogo_porta.npc_nome = _porta_perto.dialogo_trancado;
            }
        }
        exit;
    }

    // --- Prioridade 5: Tenta Falar com um NPC ---
    var _npc_perto = instance_nearest(x, y, Obj_ncp_parent);
    if (_npc_perto != noone && distance_to_object(_npc_perto) < _distancia_interacao) {
        var _chave_dialogo;
        if (variable_instance_exists(_npc_perto, "estado_conversa")) {
            _chave_dialogo = _npc_perto.nome + "_" + string(_npc_perto.estado_conversa);
            if (_npc_perto.estado_conversa < 2) { // Limite do estado
                _npc_perto.estado_conversa += 1;
            }
        } else {
            _chave_dialogo = _npc_perto.nome;
        }
        var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
        _dialogo.npc_nome = _chave_dialogo;
        if (_npc_perto.object_index == Obj_nap_pai_respirando) {
            global.falou_com_pai = true;
        }
    }
}
