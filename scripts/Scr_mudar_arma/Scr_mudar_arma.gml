// --- CÓDIGO ATUALIZADO para a função weapon_pickup() ---

function weapon_pickup() {
    
    // Encontra a arma mais próxima no chão
    var _arma_no_chao = instance_nearest(x, y, Obj_weapon_drop);
    
    if (_arma_no_chao != noone) {
        
        var _nova_arma_objeto = _arma_no_chao.weapon;
        
        // LÓGICA DE SLOTS
        
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