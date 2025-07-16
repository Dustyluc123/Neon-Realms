// --- CÓDIGO FINAL E COMPLETO para o script Scr_mudar_arma ---
// Este script agora é a sua "biblioteca" central para todas as funções de armas.

/// @function       weapon_update_equipped()
/// @description    Atualiza qual é a arma ativa do jogador com base no slot selecionado.
function weapon_update_equipped() {
    
    // Esconde todas as armas visuais para evitar que duas apareçam ao mesmo tempo
    if (instance_exists(global.inventario.arma_primaria)) {
        global.inventario.arma_primaria.visible = false;
    }
    if (instance_exists(global.inventario.arma_secundaria)) {
        global.inventario.arma_secundaria.visible = false;
    }

    // Define qual é a arma ativa (my_weapon) com base no slot escolhido
    if (global.inventario.arma_equipada_slot == 1) {
        my_weapon = global.inventario.arma_primaria;
    } else {
        my_weapon = global.inventario.arma_secundaria;
    }
    
    // Se a arma equipada realmente existe, mostra-a e atualiza os atributos do jogador
    if (instance_exists(my_weapon)) {
        my_weapon.visible = true;
        
        // Lê a "ficha técnica" da arma e copia os atributos para o jogador
        var _arma_id = my_weapon.weapon_id;
        var _arma_data = Obj_armas.armas[_arma_id];
        
        // Copia os atributos do "banco de dados" para o jogador
        weapon = _arma_id; // Atualiza o ID da arma no jogador
        proj = _arma_data[? "proj"];
        proj_sprite = _arma_data[? "proj_sprite"];
        proj_spd = _arma_data[? "proj_spd"];
        proj_damage = _arma_data[? "proj_damage"];
        proj_delay = _arma_data[? "proj_delay"];
        drop = _arma_data[? "drop"];
        
        // <<< A CORREÇÃO DEFINITIVA DO BUG ESTÁ AQUI >>>
        // Agora, a variável 'automatic' existe diretamente no jogador.
        automatic = _arma_data[? "automatic"];
    } else {
        // Se não há arma no slot, equipa "mãos vazias"
        weapon = 0;
        automatic = false;
    }
}


/// @function       weapon_pickup()
/// @description    Lógica para apanhar uma nova arma do chão e colocá-la no inventário.
function weapon_pickup() {
    var _arma_no_chao = instance_nearest(x, y, Obj_weapon_drop);
    if (_arma_no_chao != noone && distance_to_object(_arma_no_chao) < 48) {
        
        var _nova_arma_tipo = _arma_no_chao.weapon;
        var _nova_arma_inst = noone;

        // Se o slot primário está vazio...
        if (global.inventario.arma_primaria == noone) {
            _nova_arma_inst = instance_create_layer(x, y, "Instances", _nova_arma_tipo);
            global.inventario.arma_primaria = _nova_arma_inst;
            global.inventario.arma_equipada_slot = 1;
        }
        // Se o slot secundário está vazio...
        else if (global.inventario.arma_secundaria == noone) {
            _nova_arma_inst = instance_create_layer(x, y, "Instances", _nova_arma_tipo);
            global.inventario.arma_secundaria = _nova_arma_inst;
            global.inventario.arma_equipada_slot = 2;
        }
        // Se ambos os slots estão cheios...
        else {
            array_push(global.inventario.armas_na_mochila, _nova_arma_tipo);
        }
        
        // Se uma nova arma foi equipada, atualiza o estado
        if (instance_exists(_nova_arma_inst)) {
            weapon_update_equipped();
        }

        instance_destroy(_arma_no_chao);
    }
}


/// @function       atirar()
/// @description    Cria um projétil com base na arma equipada.
function atirar() {
    if (!can_shoot || !instance_exists(my_weapon)) { return; }
    
    var _p = instance_create_layer(my_weapon.x, my_weapon.y, "projeteis", proj);
    _p.sprite_index = proj_sprite;
    _p.image_angle = my_weapon.image_angle;
    _p.speed = proj_spd;
    _p.direction = my_weapon.image_angle;
    _p.damage = proj_damage;
    
    can_shoot = false;
    alarm[0] = proj_delay;
}


/// @function       weapon_drop()
/// @description    Larga a arma atualmente equipada no chão.
function weapon_drop() {
    if (!instance_exists(my_weapon)) { return; }
    
    var _inst = instance_create_layer(x, y, "Instances", drop);
    _inst.weapon = weapon; // "Etiqueta" o drop com o ID da arma
    
    _inst.image_angle = my_weapon.image_angle;
    _inst.direction = my_weapon.image_angle;
    _inst.speed = 3;
    
    // Remove a arma do slot correto do inventário
    if (global.inventario.arma_equipada_slot == 1) {
        instance_destroy(global.inventario.arma_primaria);
        global.inventario.arma_primaria = noone;
    } else {
        instance_destroy(global.inventario.arma_secundaria);
        global.inventario.arma_secundaria = noone;
    }
    
    // Tenta equipar a outra arma se existir, senão fica desarmado
    weapon_update_equipped();
}
