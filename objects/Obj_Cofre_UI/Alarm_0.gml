// --- CÓDIGO CORRIGIDO para o Evento Alarm 0 de Obj_Cofre_UI ---

// 1. Abre o documento correto que está guardado no cofre
var _doc = instance_create_layer(0, 0, "Instances_UI", obj_documento_viewer);
_doc.sprite_para_mostrar = cofre_alvo.documento_para_revelar;

// 2. Fecha a interface do cofre
instance_destroy();
