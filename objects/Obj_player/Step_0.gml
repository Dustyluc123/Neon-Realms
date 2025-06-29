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
// --- CÓDIGO DE INTERAÇÃO FINAL para o Evento Step do Obj_player ---

var _distancia_interacao = 32;

// --- Interação com a Chave para Apanhá-la ---
var _chave_perto = instance_nearest(x, y, Obj_chave_tyler);
if (_chave_perto != noone && distance_to_object(_chave_perto) < _distancia_interacao)
{
    if (keyboard_check_pressed(ord("E")))
    {
        // 1. "Apanha" a chave
        global.tem_chave_tyler = true;
        
        // 2. Destrói o objeto da chave que está no chão
        with (_chave_perto) {
            instance_destroy();
        }
        
        // 3. Opcional: Mostra um diálogo de confirmação. Isso exigiria uma nova
        // entrada no seu Scr_texto com o case "Sistema", por exemplo.
        // var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
        // _dialogo.npc_nome = "Sistema"; 
    }
}
// --- Interação com NPCs e a Porta ---
else 
{
    var _npc_perto = instance_nearest(x, y, Obj_ncp_parent);
    if (_npc_perto != noone && distance_to_object(_npc_perto) < _distancia_interacao)
    {
        if (keyboard_check_pressed(ord("E")) && !instance_exists(Obj_dialogo)) 
        {
            // É a porta do Tyler?
            if (_npc_perto.object_index == Obj_porta_tyler)
            {
                // Se NÃO tem a chave, mostre o diálogo "Porta"
                if (global.tem_chave_tyler == false) {
                    var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
                    _dialogo.npc_nome = _npc_perto.nome; // Vai usar o nome "Porta"
                }
                // Se TEM a chave, destrói tudo
                else {
                    with (Obj_porta_tyler) { animando = true; }
                    with (Obj_quarto_escuro) { instance_destroy(); }
                    with (Obj_colisao_porta_tyler) { instance_destroy(); }
                }
            }
            // É o pai?
            else if (_npc_perto.object_index == Obj_nap_pai_respirando)
            {
                global.falou_com_pai = true;
                // Inicia o diálogo normal do pai
                var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
                _dialogo.npc_nome = _npc_perto.nome;
            }
            // É outro NPC qualquer
            else
            {
                 // Inicia o diálogo normal de outros NPCs
                var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
                _dialogo.npc_nome = _npc_perto.nome;
            }
        }
    }
}
}