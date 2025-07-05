// --- CÓDIGO DE CRIAÇÃO CORRIGIDO para a Porta de Saída da Casa ---

// 1. Define qual chave esta porta específica precisa
chave_necessaria = "chave_da_casa";

// 2. Define qual diálogo ela vai usar quando estiver trancada
dialogo_trancado = "porta_saida_trancada";

// 3. Define o que acontece quando ela abre: mudar de sala
acao_ao_abrir = "mudar_de_sala";

// 4. Define para qual sala o jogador deve ir
// CORREÇÃO: Nomes de assets geralmente começam com letra maiúscula
sala_de_destino = Room_vila;

// CORREÇÃO: Usamos '=' para atribuir valores, e não ':'
target_x = 2340;
target_y = 180;

// No Código de Criação da Instância da porta de saída

