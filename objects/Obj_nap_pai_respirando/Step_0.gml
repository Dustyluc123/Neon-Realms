// --- CÓDIGO STEP COMPLETO COM LÓGICA DE SPRITES ---

switch (estado_pai)
{
    // ... (case PAI_ESTADO.BLOQUEANDO e ZOOM_OUT continuam iguais) ...
    case PAI_ESTADO.BLOQUEANDO:
        if (global.falou_com_pai == true && !instance_exists(Obj_dialogo)) {
            global.em_cutscene = true;
            if (instance_exists(meu_bloqueio)) { instance_destroy(meu_bloqueio); }
            estado_pai = PAI_ESTADO.ZOOM_OUT;
        }
        break;

    case PAI_ESTADO.ZOOM_OUT:
        var _zoom_fator = 1.3;
        var _w_alvo = cam_w_original * _zoom_fator;
        var _h_alvo = cam_h_original * _zoom_fator;
        
        cam_w_atual = lerp(cam_w_atual, _w_alvo, 0.04);
        cam_h_atual = lerp(cam_h_atual, _h_alvo, 0.04);
        
        var _centro_x = Obj_player.x;
        var _centro_y = Obj_player.y;
        var _novo_x = _centro_x - (cam_w_atual / 2);
        var _novo_y = _centro_y - (cam_h_atual / 2);
        
        _novo_x = clamp(_novo_x, 0, room_width - cam_w_atual);
        _novo_y = clamp(_novo_y, 0, room_height - cam_h_atual);
        
        camera_set_view_pos(cam, _novo_x, _novo_y);
        camera_set_view_size(cam, cam_w_atual, cam_h_atual);
        
        if (abs(cam_w_atual - _w_alvo) < 1) {
            estado_pai = PAI_ESTADO.INDO_PONTO_A;
        }
        break;

    // --- CAPÍTULOS DE MOVIMENTO COM SPRITES ---
    case PAI_ESTADO.INDO_PONTO_A:
        sprite_index = npc_pai; // << SUA PRIMEIRA SPRITE AQUI
        
        var _chegou_a = mp_linear_step(160, 230, velocidade_pai, false);
        if (_chegou_a) { 
            sprite_index = npc_pai; // Volta para a sprite de parado
            estado_pai = PAI_ESTADO.INDO_PONTO_B; 
        }
        break;

    case PAI_ESTADO.INDO_PONTO_B:
        sprite_index = npc_pai_1; // << SUA SEGUNDA SPRITE AQUI
        
        var _chegou_b = mp_linear_step(368, 230, velocidade_pai, false);
        if (_chegou_b) { 
            sprite_index = npc_pai; // Volta para a sprite de parado
            estado_pai = PAI_ESTADO.INDO_PONTO_C; 
        }
        break;

    case PAI_ESTADO.INDO_PONTO_C:
        sprite_index = npc_pai; // << SUA TERCEIRA SPRITE AQUI
        
        var _chegou_c = mp_linear_step(368, 50, velocidade_pai, false);
        if (_chegou_c) { 
            sprite_index = npc_pai; // Volta para a sprite de parado
            estado_pai = PAI_ESTADO.ZOOM_IN; 
        }
        break;
        
    // ... (case PAI_ESTADO.ZOOM_IN continua igual) ...
    case PAI_ESTADO.ZOOM_IN:
        cam_w_atual = lerp(cam_w_atual, cam_w_original, 0.05);
        cam_h_atual = lerp(cam_h_atual, cam_h_original, 0.05);
        
        var _centro_x_final = Obj_player.x;
        var _centro_y_final = Obj_player.y;
        var _novo_x_final = _centro_x_final - (cam_w_atual / 2);
        var _novo_y_final = _centro_y_final - (cam_h_atual / 2);
        
        _novo_x_final = clamp(_novo_x_final, 0, room_width - cam_w_atual);
        _novo_y_final = clamp(_novo_y_final, 0, room_height - cam_h_atual);
        
        camera_set_view_pos(cam, _novo_x_final, _novo_y_final);
        camera_set_view_size(cam, cam_w_atual, cam_h_atual);
        
        if (abs(cam_w_atual - cam_w_original) < 1) {
            global.em_cutscene = false;
            instance_destroy();
        }
        break;
}