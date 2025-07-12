// --- CÓDIGO CREATE FINAL para Obj_player ---

// Estado Inicial e Movimento
direita = 0; // Usava -1, mas 0 é um valor inicial mais seguro
esquerda = 0;
baixo = 0;
cima = 0;
hveloc = 0;
vveloc = 0;
veloc = 3;
dir = 0;
estado = Scr_personagem_andando;
estado_debuff = "normal";

// Lógica de Combate e Vida
global.life = 10;
imune = false;
tempo = 20;
hit_alpha = 0;
hit_color = c_white;
can_shoot = true;

// Variáveis de Arma (INICIALIZAÇÃO IMPORTANTE)
// Estas linhas garantem que o erro "not set" nunca mais aconteça
my_weapon = noone;
weapon = 0; // ID numérico da arma do ds_map (0 = desarmado)
automatic = false;
proj = -1;
proj_spd = 0;
proj_damage = 0;
proj_delay = 0;
drop = -1;

// Dash
dash_dir = -1;
dash_veloc = 8;

// Sombra
var minha_sombra = instance_create_layer(x, y, "Sombra", Obj_sombra);
minha_sombra.dono = id;