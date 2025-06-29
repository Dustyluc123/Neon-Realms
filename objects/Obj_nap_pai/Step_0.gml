// --- CÓDIGO FINAL E CORRIGIDO para o evento STEP de obj_nap_pai ---

switch (estado_pai)
{
    case PAI_ESTADO.BLOQUEANDO:
        if (global.falou_com_pai == true && !instance_exists(Obj_dialogo)) {
            global.em_cutscene = true;
            if (instance_exists(meu_bloqueio)) { instance_destroy(meu_bloqueio); }
            estado_pai = PAI_ESTADO.ZOOM_OUT;
        }
        break;

    case PAI_ESTADO.ZOOM_OUT:
        var _zoom_fator = 1.5;
        var _w_alvo = cam_w_original * _zoom_fator;
        var _h_alvo = cam_h_original * _zoom_fator;

        cam_w_atual = lerp(cam_w_atual, _w_alvo, 0.04);
        cam_h_atual = lerp(cam_h_atual, _h_alvo, 0.04);

        var _centro_x = cam_x_original + (cam_w_original / 2);
        var _centro_y = cam_y_original + (cam_h_original / 2);
        var _novo_x = _centro_x - (cam_w_atual / 2);
        var _novo_y = _centro_y - (cam_h_atual / 2);

        // --- CÓDIGO DE LIMITE ADICIONADO ---
        _novo_x = clamp(_novo_x, 0, room_width - cam_w_atual);
        _novo_y = clamp(_novo_y, 0, room_height - cam_h_atual);
        // --- FIM DA ADIÇÃO ---

        camera_set_view_pos(cam, _novo_x, _novo_y);
        camera_set_view_size(cam, cam_w_atual, cam_h_atual);

        if (abs(cam_w_atual - _w_alvo) < 1) {
            estado_pai = PAI_ESTADO.INDO_PONTO_A;
        }
        break;

    // ... Os seus casos INDO_PONTO_A, B, e C continuam iguais aqui ...
    case PAI_ESTADO.INDO_PONTO_A:
        mp_linear_step(160, 240, velocidade_pai, false);
        if (x == 160 && y == 240) { estado_pai = PAI_ESTADO.INDO_PONTO_B; }
        break;
    case PAI_ESTADO.INDO_PONTO_B:
        mp_linear_step(370, 240, velocidade_pai, false);
        if (x == 370 && y == 240) { estado_pai = PAI_ESTADO.INDO_PONTO_C; }
        break;
    case PAI_ESTADO.INDO_PONTO_C:
        mp_linear_step(370, 45, velocidade_pai, false);
        if (x == 370 && y == 45) { estado_pai = PAI_ESTADO.ZOOM_IN; }
        break;

    case PAI_ESTADO.ZOOM_IN:
        cam_w_atual = lerp(cam_w_atual, cam_w_original, 0.05);
        cam_h_atual = lerp(cam_h_atual, cam_h_original, 0.05);

        var _centro_x = cam_x_original + (cam_w_original / 2);
        var _centro_y = cam_y_original + (cam_h_original / 2);
        var _novo_x = _centro_x - (cam_w_atual / 2);
        var _novo_y = _centro_y - (cam_h_atual / 2);

        // --- CÓDIGO DE LIMITE ADICIONADO ---
        _novo_x = clamp(_novo_x, 0, room_width - cam_w_atual);
        _novo_y = clamp(_novo_y, 0, room_height - cam_h_atual);
        // --- FIM DA ADIÇÃO ---

        camera_set_view_pos(cam, _novo_x, _novo_y);
        camera_set_view_size(cam, cam_w_atual, cam_h_atual);

        if (abs(cam_w_atual - cam_w_original) < 1) {
            camera_set_view_size(cam, cam_w_original, cam_h_original);
            camera_set_view_pos(cam, cam_x_original, cam_y_original);
            global.em_cutscene = false;
            instance_destroy();
        }
        break;
}