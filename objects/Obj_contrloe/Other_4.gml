// --- CÓDIGO PARA O EVENTO Room Start de Obj_contrloe ---

// Garante que não haja um jogador duplicado
if (instance_exists(Obj_player)) {
    instance_destroy(Obj_player);
}

// Verifica se há uma posição de spawn definida pelo "mensageiro"
if (global.proximo_player_x != noone && global.proximo_player_y != noone)
{
    // Sim! Cria o jogador nas coordenadas exatas que a porta definiu.
    instance_create_layer(global.proximo_player_x, global.proximo_player_y, "Instances", Obj_player);
    
    // "Apaga a mensagem" para que não seja usada novamente por engano
    global.proximo_player_x = noone;
    global.proximo_player_y = noone;
}
else
{
    // Não! Isto significa que é a primeira sala do jogo.
    // Cria o jogador numa posição inicial padrão.
    // Mude 200, 200 para as coordenadas onde o Yuki deve começar o jogo.
    instance_create_layer(178, 81, "prota", Obj_player);
}