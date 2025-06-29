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
	
// --- CÓDIGO CORRIGIDO para o Evento de Colisão do Player com o NPC Pai ---

// Verifica se o jogador apertou a tecla de interação E se não há um diálogo ativo
if (keyboard_check_pressed(ord("E")) && !instance_exists(Obj_dialogo)) 
{
    // Encontra a instância exata do NPC mais próximo
    var _npc = instance_nearest(x, y, Obj_ncp_parent);

    // --- ESTA É A PARTE NOVA E CRUCIAL ---
    // Verificamos qual é o objeto da instância com a qual colidimos.
    // Se for o Obj_nap_pai...
    if (_npc.object_index == Obj_nap_pai_respirando) 
    {
        // ...então nós "viramos a chave"! O jogo agora "sabe" que a conversa aconteceu.
        global.falou_com_pai = true;
    }
    
    // O código para iniciar o diálogo continua o mesmo.
    // Ele vai pegar o nome e o texto do NPC específico (_npc) com o qual colidimos.
    var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
    _dialogo.npc_nome = _npc.nome;
    
    // Você provavelmente tem uma função para iniciar o diálogo aqui, tipo:
    // IniciarDialogo(_npc.chave_de_dialogo);
}
}