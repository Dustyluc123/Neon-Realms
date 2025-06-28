// --- NOVO CÓDIGO COMPLETO para o evento END STEP de obj_camera ---

// 1. Encontrar o alvo (o jogador)
if (!instance_exists(Obj_player)) exit;

// 2. Pegar as dimensões da câmera/view
var _view_cam = view_camera[0];
var _view_w = camera_get_view_width(_view_cam);
var _view_h = camera_get_view_height(_view_cam);

// 3. Calcular a posição alvo (centralizada no jogador)
var _target_x = Obj_player.x - _view_w / 2;
var _target_y = Obj_player.y - _view_h / 2;

// 4. Suavizar o movimento da câmera até o alvo com lerp
// (Use o valor de velocidade que você preferir aqui, ex: 0.1)
x = lerp(x, _target_x, 0.1);
y = lerp(y, _target_y, 0.1);

// ------------------- NOVA PARTE ADICIONADA -------------------
// 5. LIMITAR A CÂMERA DENTRO DOS LIMITES DA SALA
// A função clamp(valor, minimo, maximo) garante que o valor nunca saia dos limites.

// Limita a posição X da câmera
x = clamp(x, 0, room_width - _view_w);

// Limita a posição Y da câmera
y = clamp(y, 0, room_height - _view_h);
// ----------------- FIM DA NOVA PARTE ADICIONADA -----------------

// 6. Aplicar a posição FINAL e LIMITADA na câmera real
// (Arredondamos com floor() para evitar tremor de pixels)
camera_set_view_pos(_view_cam, floor(x), floor(y));