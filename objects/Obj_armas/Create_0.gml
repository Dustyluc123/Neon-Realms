// --- CÓDIGO CREATE FINAL E CORRIGIDO para Obj_armas ---

// Sem armas
armas[0] = ds_map_create();
ds_map_add(armas[0], "sprite", -1);
ds_map_add(armas[0], "proj", -1); // Projétil
ds_map_add(armas[0], "proj_spd", 0);
ds_map_add(armas[0], "proj_damage", 0);
ds_map_add(armas[0], "proj_delay", 0);
ds_map_add(armas[0], "automatic", false);
ds_map_add(armas[0], "drop", -1);

// Pistola
armas[1] = ds_map_create();
ds_map_add(armas[1], "sprite", Spr_pistola);
ds_map_add(armas[1], "proj", Obj_proj); // <<< CORREÇÃO: Usa o OBJETO do projétil
ds_map_add(armas[1], "proj_spd", 5);
ds_map_add(armas[1], "proj_damage", 300);
ds_map_add(armas[1], "proj_delay", 40);
ds_map_add(armas[1], "automatic", false);
ds_map_add(armas[1], "drop", Obj_pistol);

// Sniper
armas[2] = ds_map_create();
ds_map_add(armas[2], "sprite", Spr_sniper);
ds_map_add(armas[2], "proj", Obj_proj); // <<< CORREÇÃO: Usa o OBJETO do projétil
ds_map_add(armas[2], "proj_spd", 10);
ds_map_add(armas[2], "proj_damage", 500);
ds_map_add(armas[2], "proj_delay", 90);
ds_map_add(armas[2], "automatic", false);
ds_map_add(armas[2], "drop", Obj_sniper);

// Thompson
armas[3] = ds_map_create();
ds_map_add(armas[3], "sprite", Spr_tolpshon);
ds_map_add(armas[3], "proj", Obj_proj); // <<< CORREÇÃO: Usa o OBJETO do projétil
ds_map_add(armas[3], "proj_spd", 9);
ds_map_add(armas[3], "proj_damage", 200);
ds_map_add(armas[3], "proj_delay", 10);
ds_map_add(armas[3], "automatic", true);
ds_map_add(armas[3], "drop", Obj_tolpshon);

// O resto do seu código de inicialização do Obj_armas continua o mesmo...


weapon_id = -1;
weapon_dir = -1;

weapon_x = 0;
weapon_y = 0;

can_shoot = true


Scr_mudar_arma(self,0)


