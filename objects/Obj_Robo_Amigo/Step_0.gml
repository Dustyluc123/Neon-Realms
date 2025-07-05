// --- CÓDIGO STEP FINAL E CORRIGIDO para Obj_Robo_Amigo ---

// --- VERIFICAÇÃO DE DIÁLOGO ---
// Se um diálogo está ativo, o robô para imediatamente e sai do evento.
if (global.dialogo == true)
{
    estado = "parado";
    hsp = 0;
    vsp = 0;
    sprite_index = Spr_robo_yuki_parado; // Define a sprite de parado aqui
    exit; 
}


// --- LÓGICA DE MOVIMENTO (Só é executada se não houver diálogo) ---
switch (estado)
{
    // --- LÓGICA PARA QUANDO O ROBÔ ESTÁ A ANDAR ---
    case "andando":
        // Atualiza a sprite com base na direção
        if (hsp > 0) {
            sprite_index = Spr_robo_yuki_direita;
        } else if (hsp < 0) {
            sprite_index = Spr_robo_yuki_esquerda;
        }
        
        // Colisão Horizontal
        if (place_meeting(x + hsp, y, Obj_colisao_inimigo))
        {
            while (!place_meeting(x + sign(hsp), y, Obj_colisao_inimigo)) { x += sign(hsp); }
            hsp = 0;
            estado = "parado";
            alarm[0] = 30; // Pausa por colisão
        }
        x += hsp;

        // Colisão Vertical
        if (place_meeting(x, y + vsp, Obj_colisao_inimigo))
        {
            while (!place_meeting(x, y + sign(vsp), Obj_colisao_inimigo)) { y += sign(vsp); }
            vsp = 0;
            estado = "parado";
            alarm[0] = 30; // Pausa por colisão
        }
        y += vsp;
        
        break;
        
    // --- LÓGICA PARA QUANDO O ROBÔ ESTÁ PARADO ---
    case "parado":
        // Garante que a velocidade é zero e a sprite está correta
        hsp = 0;
        vsp = 0;
        sprite_index = Spr_robo_yuki_parado;
        
        // --- A CORREÇÃO ESTÁ AQUI ---
        // Se não estamos em diálogo, significa que o robô está parado por outra razão
        // (ex: bateu na parede ou o diálogo acabou de terminar).
        // Neste caso, ele deve tentar voltar a andar.
        if (global.dialogo == false)
        {
            // Ativa o alarme para escolher uma nova direção no próximo frame.
            // Usamos o alarme para não duplicar o código de "escolher nova direção".
            alarm[0] = 1;
        }
        
        break;
}