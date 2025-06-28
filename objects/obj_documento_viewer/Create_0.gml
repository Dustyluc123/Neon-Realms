// Guarda qual sprite de documento ele deve mostrar
sprite_para_mostrar = noone;

// Pausa o jogo. Isso impede o jogador de se mover enquanto lê.
// É uma boa prática desativar objetos para economizar processamento.
instance_deactivate_object(Obj_player); 
// Desative outros objetos se necessário (inimigos, etc.)
// instance_deactivate_object(Obj_inimigo_parente);