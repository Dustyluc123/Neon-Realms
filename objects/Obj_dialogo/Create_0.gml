// --- CÓDIGO CORRIGIDO para o Evento Create de Obj_dialogo ---

// Prepara as variáveis iniciais
pagina = 0;
carac = 0;
texto_grid = ds_grid_create(5, 0); // 5 colunas por causa do enum 'infos'
global.dialogo = true;
npc_nome = ""; // Inicia a variável como vazia

// Variável de controlo para executar o script apenas uma vez
inicializado = false;