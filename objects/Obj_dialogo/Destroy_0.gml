// --- CÓDIGO FINAL para o Evento Destroy de Obj_dialogo ---

// Avisa o jogo que o diálogo terminou e que o jogador pode voltar a mover-se.
global.dialogo = false;

// Garante que o grid de texto seja limpo da memória para evitar memory leaks.
ds_grid_destroy(texto_grid);