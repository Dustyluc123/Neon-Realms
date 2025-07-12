// --- CÓDIGO ATUALIZADO para o script Scr_mudar_arma ---

/// @function weapon_pickup()
/// @description Lógica inteligente para apanhar uma nova arma do chão.
function weapon_pickup() {
    
    var _arma_no_chao = instance_nearest(x, y, Obj_weapon_drop);
    
    if (_arma_no_chao != noone) {
        
        var _nova_arma_tipo = _arma_no_chao.weapon; // Pega o TIPO de arma (ex: Obj_pistol)
        
        // --- LÓGICA DE SLOTS ---
        
        // Se o slot primário está vazio...
        if (global.inventario.arma_primaria == noone) {
            global.inventario.arma_primaria = instance_create_layer(x, y, "Instances", _nova_arma_tipo);
            global.inventario.arma_equipada_slot = 1; // Equipa-a automaticamente
        }
        // Se o slot secundário está vazio...
        else if (global.inventario.arma_secundaria == noone) {
            global.inventario.arma_secundaria = instance_create_layer(x, y, "Instances", _nova_arma_tipo);
            global.inventario.arma_equipada_slot = 2; // Equipa-a automaticamente
        }
        // Se ambos os slots estão cheios...
        else {
            array_push(global.inventario.armas_na_mochila, _nova_arma_tipo);
            // Opcional: Mostre um diálogo "Arma guardada na mochila."
        }
        
        instance_destroy(_arma_no_chao);
    }
}


/// @function weapon_update_equipped()
/// @description Atualiza a variável 'my_weapon' do jogador com base no slot selecionado.
function weapon_update_equipped() {
    
    // Esconde todas as armas primeiro para evitar bugs visuais
    if (instance_exists(global.inventario.arma_primaria)) {
        global.inventario.arma_primaria.visible = false;
    }
    if (instance_exists(global.inventario.arma_secundaria)) {
        global.inventario.arma_secundaria.visible = false;
    }

    // Define a arma ativa
    if (global.inventario.arma_equipada_slot == 1) {
        my_weapon = global.inventario.arma_primaria;
    } else {
        my_weapon = global.inventario.arma_secundaria;
    }
    
    // Mostra a arma que está agora equipada
    if (instance_exists(my_weapon)) {
        my_weapon.visible = true;
        // Atualiza os atributos do jogador com base na arma equipada
        Scr_mudar_arma(self, my_weapon.weapon_id); // Supondo que a instância da arma tenha um "weapon_id"
    }
}