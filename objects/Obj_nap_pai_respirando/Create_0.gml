///OBJ_NPC_Car
nome = "Tyler";
// --- NOVO CÓDIGO para o evento CREATE de obj_nap_pai ---

meu_bloqueio = instance_create_layer(x, y, "Instances", obj_pai_colisao);

enum PAI_ESTADO {
    BLOQUEANDO,
    ZOOM_OUT,
    INDO_PONTO_A,
    INDO_PONTO_B,
    INDO_PONTO_C,
    ZOOM_IN
}

estado_pai = PAI_ESTADO.BLOQUEANDO; 
velocidade_pai = 1.5;

// Variáveis para controlar a câmera
cam = view_camera[0];
cam_w_original = camera_get_view_width(cam);
cam_h_original = camera_get_view_height(cam);
cam_w_atual = cam_w_original;
cam_h_atual = cam_h_original;

// --- LINHAS NOVAS ADICIONADAS ---
// Memoriza a posição inicial do canto superior esquerdo da câmera
cam_x_original = camera_get_view_x(cam);
cam_y_original = camera_get_view_y(cam);
// No final do evento Create de obj_nap_pai

spr_parado = sprite_index; // Guarda a sprite original (de "parado")