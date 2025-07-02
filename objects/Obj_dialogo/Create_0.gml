// --- CÓDIGO FINAL para o Evento Create de Obj_dialogo ---

npc_nome = "";
texto_grid = ds_grid_create(7, 0);
pagina = 0;
carac = 0;

global.dialogo = true; // "Congela" o jogador

// Variáveis de controlo
inicializar = false;      // Para a primeira inicialização
mostrando_escolhas = false; // Para saber se estamos no modo de escolha
opcao_selecionada = 0;
precisa_recarregar = false; // A nossa nova bandeira de segurança