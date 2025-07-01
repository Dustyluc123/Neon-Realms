direita=-1
esquerda=-1
baixo=-1
cima=-1
v=0

hveloc = 0;
vveloc = 0;

veloc = 3;

var cor_aleatoria = c_white
Scr_ligth(x, y, cor_aleatoria, 0.2 , 1, 1, id);
my_weapon = instance_create_layer(x,y,"Weapons",Obj_armas)
my_weapon.weapon_id=self;

dir = 0

estado = Scr_personagem_andando

estado_debuff ="normal"

//dash

dash_dir = -1
dash_veloc = 8

global.life = 10

imune = false

tempo = 20

color = c_purple

hit_alpha = 0

hit_color = c_white

// No final do evento Create de Obj_player

// Cria uma instância do nosso objeto de sombra
// CÓDIGO CORRIGIDO
var minha_sombra = instance_create_layer(x, y, "Sombra", Obj_sombra);

// Avisa para a instância da sombra recém-criada que "eu" (o jogador) sou o dono dela.
minha_sombra.dono = id;