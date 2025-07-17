// --- SCRIPT COMPLETO: Scr_mudar_arma ---
// Cole este código inteiro no seu asset de script "Scr_mudar_arma".

/// @function      weapon_update_equipped()
/// @description   Atualiza qual é a arma ativa do jogador com base no slot selecionado.
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
        
        // <<< CORREÇÃO DE ESTADO >>>
        // Define o estado da arma como "equipada" para que não seja pega do chão por engano.
        my_weapon.state = "equipped"; 
        
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
        automatic = _arma_data[? "automatic"];

    } else {
        // Se não há arma no slot, equipa "mãos vazias"
        weapon = 0;
        automatic = false;
    }
}


/// @function      weapon_pickup()
/// @description   Lógica para apanhar uma nova arma do chão, com todas as verificações de segurança.
function weapon_pickup() {
    // 1. Procura por QUALQUER arma no chão
    var _arma_no_chao = instance_place(x, y, Obj_weapon_drop);

    // 2. Verifica se a arma existe e se está no estado "on_ground"
    if (_arma_no_chao != noone && variable_instance_exists(_arma_no_chao, "state") && _arma_no_chao.state == "on_ground") {
        
        // 3. Pega o ID da arma no chão
        var _id_da_arma_no_chao = _arma_no_chao.weapon;
        
        // 4. <<< VERIFICAÇÃO FINAL E MAIS IMPORTANTE >>>
        // Garante que a arma no chão tem um ID válido (> 0) antes de continuar.
        if (_id_da_arma_no_chao > 0) {
        
            var _dados_da_arma = Obj_armas.armas[_id_da_arma_no_chao];
            var _objeto_da_arma_para_criar = _dados_da_arma[? "drop"];
            var _nova_arma_inst = noone;

            // Lógica para colocar a arma no inventário
            if (global.inventario.arma_primaria == noone) {
                _nova_arma_inst = instance_create_layer(x, y, "Instances", _objeto_da_arma_para_criar);
                global.inventario.arma_primaria = _nova_arma_inst;
                global.inventario.arma_equipada_slot = 1;
            }
            else if (global.inventario.arma_secundaria == noone) {
                _nova_arma_inst = instance_create_layer(x, y, "Instances", _objeto_da_arma_para_criar);
                global.inventario.arma_secundaria = _nova_arma_inst;
                global.inventario.arma_equipada_slot = 2;
            }
            else {
                array_push(global.inventario.armas_na_mochila, _id_da_arma_no_chao);
            }
            
            // Se uma nova arma foi criada e equipada...
            if (instance_exists(_nova_arma_inst)) {
                _nova_arma_inst.weapon_id = _id_da_arma_no_chao;
                _nova_arma_inst.state = "equipped";
                weapon_update_equipped();
            }
            
            // Apenas destrói a arma do chão se ela foi pega com sucesso.
            instance_destroy(_arma_no_chao);
        }
    }
}



/// @function      atirar()
/// @description   Cria um projétil com base na arma equipada.
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


/// @function      weapon_drop()
/// @description   Larga a arma atualmente equipada no chão.
function weapon_drop() {
    if (!instance_exists(my_weapon)) { return; }
    
    // Usa a variável 'drop' que já foi lida do banco de dados
    var _inst = instance_create_layer(x, y, "Instances", drop);
    
    // "Etiqueta" o drop com o ID da arma e seu estado
    _inst.weapon = weapon; 
    _inst.state = "on_ground"; // Define o estado para que possa ser pego
    
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