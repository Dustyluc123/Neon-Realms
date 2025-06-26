// --- Coloque este código no evento END STEP do seu obj_camera ---

// 1. Verifique se o alvo (o jogador) existe na sala
// Se não existir, o código para aqui para evitar erros.
if (!instance_exists(Obj_player)) exit;


// 2. Pegue as informações da câmera que está ativa na view 0
var _view_cam = view_camera[0];
var _view_w = camera_get_view_width(_view_cam);
var _view_h = camera_get_view_height(_view_cam);


// 3. Calcule a posição final que a câmera deve alcançar
// O alvo é a posição do jogador MENOS metade da largura/altura da tela
var _target_x = Obj_player.x - _view_w / 2;
var _target_y = Obj_player.y - _view_h / 2;


// 4. Use lerp para mover suavemente a posição do obj_camera até o alvo
// As variáveis "x" e "y" pertencem ao próprio obj_camera
// O valor 0.05 é a "velocidade". Aumente para uma câmera mais rápida, diminua para uma mais lenta.
// Tente este valor para uma câmera mais rápida
x = lerp(x, _target_x, 0.1);
y = lerp(y, _target_y, 0.1);


// 5. Atualize a câmera real com a nova posição
// Usamos floor() para arredondar o número. Isso evita que sprites em pixel art "tremam".
// É um polimento final que deixa o visual muito melhor.
camera_set_view_pos(_view_cam, floor(x), floor(y));