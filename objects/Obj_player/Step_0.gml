hit_alpha = lerp(hit_alpha,0,0.1);
if(global.life<=0){
	
	game_end()
	
}

// O jogador só pode se mover se NÃO houver diálogo E NÃO houver cutscene
if (global.dialogo == false && global.em_cutscene == false){
script_execute(estado)
}
 
 if imune = true {
	 
	 hit_alpha = 1
 }else{
   hit_alpha = 0
 }

hit_alpha = lerp(hit_alpha,0,0.3);


tempo = max(tempo - 1, 0)


if distance_to_object(Obj_ncp_parent)<= 10{
// --- CÓDIGO DE INTERAÇÃO FINAL E INTELIGENTE para o Evento Step do Obj_player ---

var _distancia_interacao = 32;
// --- CÓDIGO FINAL DE INTERAÇÃO para o Evento Step do Obj_player ---

var _distancia_interacao = 32;

if (keyboard_check_pressed(ord("E")) && !instance_exists(Obj_dialogo))
{
    var _alvo_chave = instance_nearest(x, y, Obj_Chave);
    if (_alvo_chave != noone && distance_to_object(_alvo_chave) < _distancia_interacao)
    {
        // Adiciona a chave específica ao nosso inventário
        array_push(global.inventario_chaves, _alvo_chave.nome_da_chave);
        
        // Inicia o diálogo específico desta chave
        IniciarDialogo(_alvo_chave.dialogo_ao_apanhar); // Usa a função global
        
        // Destrói o objeto da chave
        instance_destroy(_alvo_chave);
    }
    else
    {
        var _alvo_porta = instance_nearest(x, y, Obj_Porta_Trancavel);
        if (_alvo_porta != noone && distance_to_object(_alvo_porta) < _distancia_interacao)
        {
            if (_alvo_porta.trancada == true) {
                var _tem_a_chave = array_contains(global.inventario_chaves, _alvo_porta.chave_necessaria);
                if (_tem_a_chave) {
                    with (_alvo_porta) { animando = true; }
                    // ... destruir colisão e escuridão ...
                } else {
                    IniciarDialogo(_alvo_porta.dialogo_trancado);
                }
            }
        }
        else
        {
            var _alvo_npc = instance_nearest(x, y, Obj_ncp_parent);
            if (_alvo_npc != noone && distance_to_object(_alvo_npc) < _distancia_interacao)
            {
                // Lógica de diálogo normal com NPCs
            }
        }
    }
}
}