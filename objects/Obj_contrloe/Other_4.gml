// --- CÓDIGO FINAL E CORRIGIDO para o Evento Room Start de Obj_contrloe ---

// Garante que não haja um jogador ou câmera duplicados ao iniciar a sala
if (instance_exists(Obj_player)) {
    instance_destroy(Obj_player);
}
if (instance_exists(Obj_camera)) {
    instance_destroy(Obj_camera);
}

// Variáveis temporárias para a posição de spawn
var _spawn_x;
var _spawn_y;

// Verifica se há uma posição de spawn definida pelo "mensageiro" (pela porta)
if (global.proximo_player_x != noone && global.proximo_player_y != noone)
{
    // Sim! Define as coordenadas de spawn para as que a porta passou.
    _spawn_x = global.proximo_player_x;
    _spawn_y = global.proximo_player_y;
    
    // "Apaga a mensagem" para que não seja usada novamente
    global.proximo_player_x = noone;
    global.proximo_player_y = noone;
}
else
{
    // Não! Isto significa que é a primeira sala do jogo.
    // Define as coordenadas de spawn para a posição inicial padrão.
    // Mude 200, 200 para as coordenadas onde o Yuki deve começar o jogo.
    _spawn_x = 138;
    _spawn_y = 71;
}

// --- CRIAÇÃO DOS OBJETOS ---

// 1. Cria o jogador na posição de spawn definida.
instance_create_layer(_spawn_x, _spawn_y, "prota", Obj_player);

// 2. Cria a câmera EXATAMENTE na mesma posição.
// O código da câmera já sabe como se centrar suavemente no jogador.
instance_create_layer(_spawn_x, _spawn_y, "prota", Obj_camera);