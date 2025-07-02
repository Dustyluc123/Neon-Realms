// --- CÓDIGO FINAL E SEGURO para o Evento Clean Up (ou Destroy) de Obj_dialogo ---

// Avisa o jogo que o diálogo terminou, libertando o jogador.
global.dialogo = false;

// VERIFICAÇÃO DE SEGURANÇA:
// A função ds_exists verifica se o ID na variável corresponde a um tipo de dados específico.
// Isto garante que só tentamos destruir o grid se ele for, de facto, um grid válido.
if (ds_exists(texto_grid, ds_type_grid))
{
    ds_grid_destroy(texto_grid);
}