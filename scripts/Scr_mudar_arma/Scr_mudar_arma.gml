// --- CÓDIGO CORRIGIDO para a sua função no script Scr_mudar_arma ---

function Scr_mudar_arma(player_id, weapon_index) {

    // Guarda o ID numérico da arma atual
    player_id.weapon = weapon_index;
    
    // --- Transferência de Atributos ---
    // Lê a "ficha técnica" da arma no seu "banco de dados" (o ds_map do Obj_armas)
    // e copia cada atributo para uma variável dentro do JOGADOR.
    
    var _arma_data = Obj_armas.armas[weapon_index];
    
    player_id.sprite_index = _arma_data[? "sprite"];
    player_id.proj = _arma_data[? "proj"];
    player_id.proj_spd = _arma_data[? "proj_spd"];
    player_id.proj_damage = _arma_data[? "proj_damage"];
    player_id.proj_delay = _arma_data[? "proj_delay"];
    player_id.drop = _arma_data[? "drop"];
    
    // --- A CORREÇÃO CRUCIAL ESTÁ AQUI ---
    // Copia a propriedade "automatic" do ds_map para uma variável no jogador.
    player_id.automatic = _arma_data[? "automatic"];
}