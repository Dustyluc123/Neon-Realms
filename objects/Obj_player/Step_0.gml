// --- CÓDIGO FINAL E COMPLETO para o evento STEP de Obj_player ---

// --- Lógica que roda sempre ---
hit_alpha = lerp(hit_alpha, 0, 0.1);
if (global.life <= 0) { game_end(); }
if (imune == true) { hit_alpha = 1; } else { hit_alpha = 0; }
tempo = max(tempo - 1, 0);

// --- Lógica de Ação do Jogador ---
// Só executa o movimento e a troca de armas se não houver diálogo ou cutscene
if (global.dialogo == false && global.em_cutscene == false) 
{
    script_execute(estado);
    
    // --- Lógica de Troca de Armas ---
    var _trocar_para_1 = keyboard_check_pressed(ord("1"));
    var _trocar_para_2 = keyboard_check_pressed(ord("2"));

    if (_trocar_para_1 && global.inventario.arma_primaria != noone) {
        global.inventario.arma_equipada_slot = 1;
    }
    if (_trocar_para_2 && global.inventario.arma_secundaria != noone) {
        global.inventario.arma_equipada_slot = 2;
    }

    // --- Atualiza qual é a arma ativa ---
    if (global.inventario.arma_equipada_slot == 1) {
        my_weapon = global.inventario.arma_primaria;
    } else {
        my_weapon = global.inventario.arma_secundaria;
    }
}

// --- LÓGICA DE INTERAÇÃO UNIFICADA (tecla 'E') ---
var _distancia_interacao = 48;

if (keyboard_check_pressed(ord("E")) && !instance_exists(Obj_dialogo) && global.em_cutscene == false)
{
    // --- PRIORIDADE 1: TENTA APANHAR UMA ARMA ---
    var _arma_perto = instance_nearest(x, y, Obj_weapon_drop);
    if (_arma_perto != noone && distance_to_object(_arma_perto) < _distancia_interacao)
    {
        weapon_pickup(); // Chama a sua função de apanhar a arma
        exit; // Apanhou a arma, não faz mais nada
    }
    
    // --- PRIORIDADE 2: TENTA INTERAGIR COM O COFRE ---
    var _cofre_perto = instance_nearest(x, y, Obj_Cofre);
    if (_cofre_perto != noone && distance_to_object(_cofre_perto) < _distancia_interacao)
    {
        if (!instance_exists(Obj_Cofre_UI)) {
            var _ui = instance_create_layer(0, 0, "Instances_UI", Obj_Cofre_UI);
            _ui.cofre_alvo = _cofre_perto;
        }
        exit;
    }
    
    // --- PRIORIDADE 3: TENTA INTERAGIR COM UMA CHAVE ---
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
    
    // --- PRIORIDADE 4: TENTA INTERAGIR COM UMA PORTA ---
    // (O seu código de porta continua aqui, igual)
    
    // --- PRIORIDADE 5: TENTA FALAR COM UM NPC ---
    // (O seu código de NPC continua aqui, igual)
}