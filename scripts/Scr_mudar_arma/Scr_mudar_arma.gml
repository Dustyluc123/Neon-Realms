// --- CÓDIGO FINAL E COMPLETO para o script Scr_mudar_arma ---
// Este script agora contém todas as funções globais para gerir as armas.

/// @function       weapon_update_equipped()
/// @description    Atualiza qual é a arma ativa do jogador e copia os seus atributos.
function weapon_update_equipped() {
    
    // Esconde todas as armas primeiro para evitar que duas apareçam ao mesmo tempo.
    if (instance_exists(global.inventario.arma_primaria)) {
        global.inventario.arma_primaria.visible = false;
    }
    if (instance_exists(global.inventario.arma_secundaria)) {
        global.inventario.arma_secundaria.visible = false;
    }

    // Define qual é a arma ativa com base no slot escolhido.
    if (global.inventario.arma_equipada_slot == 1) {
        my_weapon = global.inventario.arma_primaria;
    } else {
        my_weapon = global.inventario.arma_secundaria;
    }
    
    // Se a arma equipada realmente existe...
    if (instance_exists(my_weapon)) {
        // ...mostra-a...
        my_weapon.visible = true;
        
        // ...e lê a "ficha técnica" dela para atualizar os atributos do jogador.
        var _arma_id = my_weapon.weapon_id; // Lê o ID da instância da arma
        var _arma_data = Obj_armas.armas[_arma_id]; // Acede ao banco de dados em Obj_armas
        
        // Copia os atributos do "banco de dados" para o JOGADOR.
        weapon = _arma_id;
        proj = _arma_data[? "proj"];
        proj_spd = _arma_data[? "proj_spd"];
        proj_damage = _arma_data[? "proj_damage"];
        proj_delay = _arma_data[? "proj_delay"];
        drop = _arma_data[? "drop"];
        
        // <<< A CORREÇÃO CRUCIAL QUE RESOLVE O SEU ERRO >>>
        // Agora, o jogador sabe se a sua arma é automática.
        automatic = _arma_data[? "automatic"];
    } else {
        // Se não há arma equipada, define os atributos de "mãos vazias".
        my_weapon = noone;
        weapon = 0;
        automatic = false;
    }
}


/// @function       weapon_pickup()
/// @description    Lógica inteligente para apanhar uma nova arma do chão.
function weapon_pickup() {
    var _arma_no_chao = instance_nearest(x, y, Obj_weapon_drop);
    if (_arma_no_chao != noone && distance_to_object(_arma_no_chao) < 48) {
        
        var _nova_arma_tipo = _arma_no_chao.weapon_obj; // Lê o TIPO de arma (ex: Obj_pistol)
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
            // Opcional: Mostrar um diálogo "Arma guardada na mochila."
        }
        
        // Se uma nova arma foi equipada, atualiza o estado do jogador.
        if (instance_exists(_nova_arma_inst)) {
            weapon_update_equipped();
        }

        instance_destroy(_arma_no_chao);
    }
}


/// @function       weapon_drop()
/// @description    Larga a arma atualmente equipada no chão.
function weapon_drop() {
    if (!instance_exists(my_weapon)) { return; }
    
    // Cria o objeto de "drop" (a arma no chão).
    var _inst_drop = instance_create_layer(x, y, "Instances", Obj_weapon_drop);
    
    // "Etiqueta" o drop com o tipo de arma que ele representa.
    _inst_drop.weapon_obj = my_weapon.object_index;
    
    // Define a sua física inicial.
    _inst_drop.image_angle = my_weapon.image_angle;
    _inst_drop.direction = my_weapon.image_angle;
    _inst_drop.speed = 3;
    
    // Remove a arma do slot correto do inventário.
    if (global.inventario.arma_equipada_slot == 1) {
        instance_destroy(global.inventario.arma_primaria);
        global.inventario.arma_primaria = noone;
    } else {
        instance_destroy(global.inventario.arma_secundaria);
        global.inventario.arma_secundaria = noone;
    }
    
    // Tenta equipar a outra arma se existir, senão fica desarmado.
    weapon_update_equipped();
}


/// @function       atirar()
/// @description    Cria um projétil com base nos atributos atuais do jogador.
function atirar() {
    if (!can_shoot || !instance_exists(my_weapon)) { return; }
    
    // Usa as variáveis que estão no jogador (que foram copiadas pela weapon_update_equipped).
    var _p = instance_create_layer(my_weapon.x, my_weapon.y, "projeteis", proj);
    _p.image_angle = my_weapon.image_angle;
    _p.speed = proj_spd;
    _p.direction = my_weapon.image_angle;
    _p.damage = proj_damage;
    
    can_shoot = false;
    alarm[0] = proj_delay;
}