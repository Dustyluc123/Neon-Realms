// No Create de Obj_weapon_drop
weapon = 1; // Define um tipo de arma padrão (ex: 1 = pistola)

// No Create de Obj_weapon_drop
weapon_obj = Obj_pistol; // Define um tipo de arma padrão para evitar erros

if (!variable_instance_exists(self, "weapon")) {
    show_debug_message("ERRO: Drop sem weapon setado!");
    weapon = 0; // valor de fallback
}
