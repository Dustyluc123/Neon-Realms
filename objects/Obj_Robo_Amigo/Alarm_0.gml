// --- CÓDIGO ALARM 0 FINAL para Obj_Robo_Amigo ---

// 1. Muda o estado de volta para "andando"
estado = "andando";

// 2. Escolhe uma nova direção e velocidade aleatória
hsp = random_range(-velocidade_max, velocidade_max);
vsp = random_range(-velocidade_max, velocidade_max);

// 3. Verificação de segurança para evitar que o robô fique parado
if (abs(hsp) < 0.5 && abs(vsp) < 0.5) {
    alarm[0] = 1; // Se a velocidade sorteada for muito baixa, tenta de novo no próximo frame
}