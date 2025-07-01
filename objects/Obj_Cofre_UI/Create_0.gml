// --- CÓDIGO CREATE CORRIGIDO para Obj_Cofre_UI ---

cofre_alvo = noone;
senha_digitada = "";
tamanho_max_senha = 6;
feedback_visual = 0;
feedback_timer = 0;
botao_pressionado_valor = noone; // Adicionado da nossa correção anterior
global.em_cutscene = true;

// --- CORREÇÃO APLICADA AQUI ---
// Removemos a palavra "var" para que estas variáveis existam para todo o objeto
teclado_x = display_get_gui_width() / 2;
teclado_y = display_get_gui_height() / 2;

// --- CRIAÇÃO DOS BOTÕES (continua igual) ---
lista_de_botoes = [];

// Cria os botões de 1 a 9
for (var i = 0; i < 9; i++) {
    var _bx = (teclado_x - 60) + (i mod 3) * 60;
    var _by = (teclado_y - 0) + floor(i / 3) * 60;
    var _btn = instance_create_layer(_bx, _by, "Instances_UI", Obj_Botao_Teclado);
    _btn.valor = string(i + 1);
    array_push(lista_de_botoes, _btn);
}

// Cria os outros botões
var _btn_apagar = instance_create_layer(teclado_x - 60, teclado_y + 180, "Instances_UI", Obj_Botao_Teclado);
_btn_apagar.valor = "apagar";
array_push(lista_de_botoes, _btn_apagar);

var _btn_0 = instance_create_layer(teclado_x, teclado_y + 180, "Instances_UI", Obj_Botao_Teclado);
_btn_0.valor = "0";
array_push(lista_de_botoes, _btn_0);

var _btn_enter = instance_create_layer(teclado_x + 60, teclado_y + 180, "Instances_UI", Obj_Botao_Teclado);
_btn_enter.valor = "enter";
array_push(lista_de_botoes, _btn_enter);

// No final do evento Create de Obj_Cofre_UI

// Cria o botão de "Sair"
var _btn_sair = instance_create_layer(teclado_x, teclado_y + 240, "Instances_UI", Obj_Botao_Teclado); // Ajuste a posição Y
_btn_sair.valor = "sair";
array_push(lista_de_botoes, _btn_sair);