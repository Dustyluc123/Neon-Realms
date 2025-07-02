// --- CÓDIGO FINAL E CORRIGIDO para o Evento Step do Obj_player ---

// --- Lógica de vida, dano, etc. (seu código original) ---
hit_alpha = lerp(hit_alpha, 0, 0.1);
if (global.life <= 0) { game_end(); }
if (imune == true) { hit_alpha = 1; } else { hit_alpha = 0; }
tempo = max(tempo - 1, 0);

// --- Lógica de Ação do Jogador ---
if (global.dialogo == false && global.em_cutscene == false) {
    script_execute(estado);
}

// --- LÓGICA DE INTERAÇÃO CORRIGIDA ---
var _distancia_interacao = 10;

if (keyboard_check_pressed(ord("E")) && !instance_exists(Obj_dialogo) && global.em_cutscene == false)
{
    // Encontra o NPC/objeto interagível mais próximo
    var _alvo = instance_nearest(x, y, Obj_ncp_parent);
    
    // Se encontrou um alvo e está perto o suficiente...
    if (_alvo != noone && distance_to_object(_alvo) < _distancia_interacao)
    {
        // ...vamos descobrir que tipo de alvo é com um switch.
        switch (_alvo.object_index)
        {
            // CASO 1: O alvo é a CHAVE
            case Obj_Chave:
                array_push(global.inventario_chaves, _alvo.nome_da_chave);
                instance_destroy(_alvo);
                var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
                _dialogo.npc_nome = "Chave";
                break;
            
            // CASO 2: O alvo é a PORTA
            case Obj_Porta_Trancavel:
                if (_alvo.trancada == true) {
                    var _tem_a_chave = array_contains(global.inventario_chaves, _alvo.chave_necessaria);
                    if (_tem_a_chave) {
                        _alvo.trancada = false;
                        with (Obj_quarto_escuro) { instance_destroy(); }
                        with (Obj_colisao_porta_tyler) { instance_destroy(); }
                    } else {
                        var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
                        _dialogo.npc_nome = _alvo.nome;
                    }
                }
                break;
            
            // CASO 3: O alvo é o PAI
            case Obj_nap_pai_respirando:
                global.falou_com_pai = true;
                var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
                _dialogo.npc_nome = _alvo.nome;
                break;

            // CASO PADRÃO: É qualquer outro NPC
            default:
                var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
                _dialogo.npc_nome = _alvo.nome;
                break;
        }
    }
}