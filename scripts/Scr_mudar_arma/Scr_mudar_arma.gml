// Script: Scr_mudar_arma
// Este script contém todas as funções relacionadas com a gestão das armas do jogador.

/// @function Scr_mudar_arma(player_id, weapon_index)
/// @description Equipa uma nova arma no jogador, transferindo os atributos do ds_map.
function Scr_mudar_arma(player_id, weapon_index) {

    // Guarda o ID da arma atual para referência
    player_id.weapon = weapon_index;
    
    // --- Transferência de Atributos ---
    // Lê a "ficha técnica" da arma no seu banco de dados (o ds_map)
    // e copia cada atributo para uma variável dentro do jogador.
    
    var _arma_data = armas[weapon_index];
    
    player_id.sprite_index = _arma_data[? "sprite"];
    player_id.proj = _arma_data[? "proj"];
    player_id.proj_spd = _arma_data[? "proj_spd"];
    player_id.proj_damage = _arma_data[? "proj_damage"];
    player_id.proj_delay = _arma_data[? "proj_delay"];
    player_id.drop = _arma_data[? "drop"];
    
    // --- A CORREÇÃO CRUCIAL ESTÁ AQUI ---
    // Copia a propriedade "automatic" do ds_map para uma variável no jogador.
    // Agora, o seu código de tiro pode ler "player_id.automatic" sem erros.
    player_id.automatic = _arma_data[? "automatic"];
}


/// @function weapon_pickup()
/// @description Lógica para apanhar uma nova arma do chão e geri-la no novo inventário.
function weapon_pickup() {
    
    // Encontra a arma mais próxima no chão
    var _arma_no_chao = instance_nearest(x, y, Obj_weapon_drop);
    
    if (_arma_no_chao != noone) {
        
        var _nova_arma_objeto = _arma_no_chao.weapon;
        
        // --- LÓGICA DE SLOTS DO NOVO INVENTÁRIO ---
        
        // Se o slot primário está vazio...
        if (global.inventario.arma_primaria == noone) {
            // ...a nova arma vai para lá.
            global.inventario.arma_primaria = instance_create_layer(x, y, "Instances", _nova_arma_objeto);
            global.inventario.arma_equipada_slot = 1; // Equipa-a automaticamente
        }
        // Se o slot secundário está vazio...
        else if (global.inventario.arma_secundaria == noone) {
            // ...a nova arma vai para lá.
            global.inventario.arma_secundaria = instance_create_layer(x, y, "Instances", _nova_arma_objeto);
            global.inventario.arma_equipada_slot = 2; // Equipa-a automaticamente
        }
        // Se ambos os slots estão cheios...
        else {
            // ...a arma vai para o "mochilão".
            array_push(global.inventario.armas_na_mochila, _nova_arma_objeto);
            
            // Opcional: Mostra um diálogo "Arma guardada na mochila."
            // IniciarDialogo("arma_guardada");
        }
        
        // Destrói a arma que estava no chão
        instance_destroy(_arma_no_chao);
    }
}


/// @function weapon_drop()
