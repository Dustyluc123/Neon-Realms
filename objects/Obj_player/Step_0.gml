// --- CÓDIGO FINAL E COMPLETO para o evento STEP de Obj_player ---

// --- Lógica que roda sempre (seu código original de vida, dano, etc.) ---
hit_alpha = lerp(hit_alpha, 0, 0.1);
if (global.life <= 0) { game_end(); }
if (imune == true) { hit_alpha = 1; } else { hit_alpha = 0; }
tempo = max(tempo - 1, 0);


// --- Lógica de Ação do Jogador ---
// Executa o estado atual (movimento, etc.) se não houver diálogo ou cutscene
if (global.dialogo == false && global.em_cutscene == false) {
    script_execute(estado);
}


// --- CÓDIGO FINAL DE INTERAÇÃO para o Evento Step do Obj_player ---

var _distancia_interacao = 10;

// Verifica se a tecla 'E' foi pressionada e se não estamos em diálogo/cutscene
if (keyboard_check_pressed(ord("E")) && !instance_exists(Obj_dialogo) && global.em_cutscene == false)
{
    // --- 1. TENTA INTERAGIR COM UMA CHAVE ---
    var _chave_perto = instance_nearest(x, y, Obj_Chave);
    if (_chave_perto != noone && distance_to_object(_chave_perto) < _distancia_interacao)
    {
        // --- CORREÇÃO APLICADA AQUI ---
        // Primeiro, lemos o nome do diálogo e guardamo-lo numa variável temporária.
        var _dialogo_para_mostrar = _chave_perto.dialogo_ao_apanhar;

        // Agora que já guardámos a informação, podemos apanhar a chave.
        array_push(global.inventario_chaves, _chave_perto.nome_da_chave);
        
        // E destruir o objeto da chave.
        instance_destroy(_chave_perto);
        
        // Finalmente, usamos a informação que guardámos para criar o diálogo.
        var _dialogo_chave = instance_create_layer(x, y, "dialogo", Obj_dialogo);
        _dialogo_chave.npc_nome = _dialogo_para_mostrar;
        // --- FIM DA CORREÇÃO ---
        
        exit; // Sai do script para não interagir com mais nada neste frame
    }
    
    // --- 2. TENTA INTERAGIR COM UMA PORTA ---
    var _porta_perto = instance_nearest(x, y, Obj_Porta_Trancavel);
    if (_porta_perto != noone && distance_to_object(_porta_perto) < _distancia_interacao)
    {
        if (_porta_perto.trancada == true) {
            
            var _tem_a_chave = array_contains(global.inventario_chaves, _porta_perto.chave_necessaria);
            
            if (_tem_a_chave) {
                _porta_perto.trancada = false;

                switch (_porta_perto.acao_ao_abrir) {
                    case "destruir_objetos":
                        with (Obj_quarto_escuro) { instance_destroy(); }
                        with (Obj_colisao_porta_tyler) { instance_destroy(); }
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

    // --- 3. TENTA FALAR COM UM NPC ---
    var _npc_perto = instance_nearest(x, y, Obj_ncp_parent);
    if (_npc_perto != noone && distance_to_object(_npc_perto) < _distancia_interacao)
    {
        var _dialogo_npc = instance_create_layer(x, y, "dialogo", Obj_dialogo);
        _dialogo_npc.npc_nome = _npc_perto.nome;
        
        if (_npc_perto.object_index == Obj_nap_pai_respirando) {
            global.falou_com_pai = true;
        }
    }
}