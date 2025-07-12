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
// --- CÓDIGO para adicionar ao Step do Obj_player ---

// --- Lógica de Troca de Armas ---
var _trocar_para_1 = keyboard_check_pressed(ord("1"));
var _trocar_para_2 = keyboard_check_pressed(ord("2"));
var _mudou_de_arma = false;

// Se o jogador pressionar "1" e a arma primária existir
if (_trocar_para_1 && global.inventario.arma_primaria != noone) {
    global.inventario.arma_equipada_slot = 1;
    _mudou_de_arma = true;
}

// Se o jogador pressionar "2" e a arma secundária existir
if (_trocar_para_2 && global.inventario.arma_secundaria != noone) {
    global.inventario.arma_equipada_slot = 2;
    _mudou_de_arma = true;
}

// Se a arma foi trocada, ou se é o primeiro frame do jogador, atualiza a arma equipada
if (_mudou_de_arma || !variable_instance_exists(id, "my_weapon")) {
    weapon_update_equipped();
}
}


// --- LÓGICA DE INTERAÇÃO (tecla 'E') ---
var _distancia_interacao = 10; 

// Verifica se a tecla 'E' foi pressionada e se não estamos em diálogo/cutscene
if (keyboard_check_pressed(ord("E")) && !instance_exists(Obj_dialogo) && global.em_cutscene == false)
{
    // --- PRIORIDADE 1: TENTA INTERAGIR COM O COFRE ---
    var _cofre_perto = instance_nearest(x, y, Obj_Cofre);
    if (_cofre_perto != noone && distance_to_object(_cofre_perto) < _distancia_interacao)
    {
        // Só cria a UI do cofre se ela já não existir
        if (!instance_exists(Obj_Cofre_UI)) {
            var _ui = instance_create_layer(0, 0, "Instances_UI", Obj_Cofre_UI); // Crie numa camada de UI
            _ui.cofre_alvo = _cofre_perto; // Diz à UI qual cofre foi aberto
        }
        exit; // Interagiu com o cofre, não faz mais nada neste frame
    }
    
    // --- PRIORIDADE 2: TENTA INTERAGIR COM UMA CHAVE ---
    var _chave_perto = instance_nearest(x, y, Obj_Chave);
    if (_chave_perto != noone && distance_to_object(_chave_perto) < _distancia_interacao)
    {
        var _dialogo_para_mostrar = _chave_perto.dialogo_ao_apanhar;
        array_push(global.inventario.chaves, _chave_perto.nome_da_chave);
        instance_destroy(_chave_perto);
        var _dialogo_chave = instance_create_layer(x, y, "dialogo", Obj_dialogo);
        _dialogo_chave.npc_nome = _dialogo_para_mostrar;
        exit;
    }
    
    // --- PRIORIDADE 3: TENTA INTERAGIR COM UMA PORTA ---
    var _porta_perto = instance_nearest(x, y, Obj_Porta_Trancavel);
    if (_porta_perto != noone && distance_to_object(_porta_perto) < _distancia_interacao)
    {
        if (_porta_perto.trancada == true) {
            var _tem_a_chave = array_contains(global.inventario.chaves, _porta_perto.chave_necessaria);
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

   // --- Dentro da sua lógica de interação no Step do Obj_player ---

// ... (depois de verificar chaves e portas)
// --- DENTRO DO SEU BLOCO DE INTERAÇÃO no Evento Step do Obj_player ---
// (Depois de verificar chaves e portas)

// Tenta falar com um NPC genérico
// --- DENTRO DO SEU BLOCO DE INTERAÇÃO no Evento Step do Obj_player ---
// (Depois de verificar chaves e portas)

// Tenta falar com um NPC genérico
var _npc_perto = instance_nearest(x, y, Obj_ncp_parent);
if (_npc_perto != noone && distance_to_object(_npc_perto) < _distancia_interacao)
{
    var _chave_dialogo; // Variável para guardar o nome do diálogo a ser chamado

    // --- VERIFICAÇÃO DE SEGURANÇA ---
    // A função variable_instance_exists verifica se o NPC tem a variável "estado_conversa"
    if (variable_instance_exists(_npc_perto, "estado_conversa"))
    {
        // SE SIM: Este é um NPC com múltiplos diálogos (como o Tyler)
        
        // Cria a chave de diálogo única, como "Tyler_0"
        _chave_dialogo = _npc_perto.nome + "_" + string(_npc_perto.estado_conversa);
        
        // Avança o estado da conversa para a próxima vez
        if (_npc_perto.estado_conversa < 2) // Defina aqui o último estado do NPC
        {
            _npc_perto.estado_conversa += 1;
        }
    }
    else
    {
        // SE NÃO: Este é um NPC simples com apenas um diálogo
        // Usa diretamente o nome do NPC como a chave do diálogo
        _chave_dialogo = _npc_perto.nome;
    }
    
    // --- Inicia o diálogo com a chave correta ---
    var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
    _dialogo.npc_nome = _chave_dialogo;
    
    // Lógica específica que já tínhamos (continua igual)
    if (_npc_perto.object_index == Obj_nap_pai_respirando) {
        global.falou_com_pai = true;
    }
}
}