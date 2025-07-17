
/// @description Create Event da Pistola

// <<< LINHA MAIS IMPORTANTE >>>
// Executa o Evento Create do objeto-pai (Obj_weapon_drop) primeiro.
// Isso vai criar as variáveis 'weapon' e 'state'.
event_inherited();
// Exemplo para o Create do Obj_pistol
weapon_id = 1; // O ID correspondente no seu ds_map
automatic = false; // A pistola não é automática
weapon_obj = Obj_pistol; // ou o objeto correto da arma, ex: Obj_sniper, Obj_tolpshon, etc.
