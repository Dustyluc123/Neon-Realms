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

// Verifica se a tecla de interação foi pressionada e se não há um diálogo ativo
if (keyboard_check_pressed(ord("E")) && !instance_exists(Obj_dialogo))
{
    // --- 1. TENTA INTERAGIR COM UMA PORTA TRANCÁVEL ---
    var _porta_perto = instance_nearest(x, y, Obj_Porta_Trancavel);
    if (_porta_perto != noone && distance_to_object(_porta_perto) < _distancia_interacao)
    {
        // Se a porta ainda estiver trancada...
        if (_porta_perto.trancada == true) {
            
            // Verifica se o jogador tem a chave necessária para ESTA porta
            var _tem_a_chave = array_contains(global.inventario_chaves, _porta_perto.chave_necessaria);
            
            if (_tem_a_chave) {
                // Sim! Destranca a porta. O evento Step dela cuidará da animação.
                _porta_perto.trancada = false;

                // AGORA, O JOGADOR LÊ A AÇÃO DA PORTA E EXECUTA-A
                switch (_porta_perto.acao_ao_abrir)
                {
                    case "destruir_objetos":
                        // Para a porta do quarto do Tyler
                        with (Obj_quarto_escuro) { instance_destroy(); }
                        with (Obj_colisao_porta_tyler) { instance_destroy(); }
                        break;
                        
                    case "mudar_de_sala":
                        // Para a porta de saída da casa
                        room_goto(_porta_perto.sala_de_destino);
                        break;
                }
            } else {
                // Não tem a chave, mostra o diálogo específico desta porta
                var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
                _dialogo.npc_nome = "Porta"; // Assumindo que o seu Scr_texto lida com isto
            }
        }
        exit; // Sai para não interagir com mais nada neste frame
    }
    
    // --- 2. TENTA APANHAR UMA CHAVE ---
    var _chave_perto = instance_nearest(x, y, Obj_Chave);
    if (_chave_perto != noone && distance_to_object(_chave_perto) < _distancia_interacao)
    {
        array_push(global.inventario_chaves, _chave_perto.nome_da_chave);
        instance_destroy(_chave_perto);
        var _dialogo_chave = instance_create_layer(x, y, "dialogo", Obj_dialogo);
        _dialogo_chave.npc_nome = "Chave";
        exit;
    }
    
    // --- 3. SE NÃO, TENTA FALAR COM UM NPC NORMAL ---
    var _npc_perto = instance_nearest(x, y, Obj_ncp_parent);
    if (_npc_perto != noone && distance_to_object(_npc_perto) < _distancia_interacao)
    {
        // A sua lógica de diálogo normal com NPCs
    }
}
}