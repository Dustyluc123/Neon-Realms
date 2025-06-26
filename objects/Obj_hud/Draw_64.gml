///OBJ_HUD


var porcentajesalud = health / 100;
 porcentajesalud = ceil(health / 100 *global.life)
 

for (var i = 0;i<porcentajesalud;i++){
     draw_sprite(Spr_coracao, 0, 16 + 32 * i, 32)
}
