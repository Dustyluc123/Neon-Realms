// Evento End Step de Obj_camera

// Se uma cutscene está a acontecer, esta câmera não faz absolutamente nada.
if (global.em_cutscene == true) 
{
    // Apenas diz à câmera para se preparar para o fim da cutscene
    cutscene_estava_ativa = true; 
    exit; // Abandona o evento
}

// Se chegámos aqui, a cutscene NÃO está ativa.

// Pega as dimensões e o alvo (o jogador)
var _view_cam = view_camera[0];
var _view_w = camera_get_view_width(_view_cam);
var _view_h = camera_get_view_height(_view_cam);
var _target_x = Obj_player.x - _view_w / 2;
var _target_y = Obj_player.y - _view_h / 2;

// Se a cutscene estava ativa no frame passado, mas agora não está mais...
if (cutscene_estava_ativa == true)
{
    // ...a cutscene ACABOU DE TERMINAR!
    // Para evitar o "salto", nós "teleportamos" a posição interna da câmera
    // para o sítio certo ANTES de recomeçar o movimento suave.
    x = _target_x;
    y = _target_y;
    
    // Reseta a nossa memória
    cutscene_estava_ativa = false;
}

// Agora, faz o movimento suave normal a partir da posição correta
x = lerp(x, _target_x, 0.1);
y = lerp(y, _target_y, 0.1);

// Limita a câmera à sala e aplica a posição
x = clamp(x, 0, room_width - _view_w);
y = clamp(y, 0, room_height - _view_h);
camera_set_view_pos(_view_cam, floor(x), floor(y));