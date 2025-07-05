nome = "Robo_yuki";
estado_conversa = 1;
// --- CÓDIGO CREATE FINAL para Obj_Robo_Amigo ---

// --- Máquina de Estados ---
// "andando": O robô está a mover-se.
// "parado": O robô bateu numa parede e está em pausa.
estado = "parado";

// --- Variáveis de Movimento ---
hsp = 0; // Velocidade horizontal
vsp = 0; // Velocidade vertical
velocidade_max = 1; // A velocidade máxima do robô. Ajuste este valor!

// --- Configuração Inicial ---
// Ativa o alarme para que o robô comece a andar quase imediatamente.
alarm[0] = 1; 

// Cria a luz roxa que segue o robô.
Scr_ligth(x, y, c_purple, 0.6, 1, 1, id);