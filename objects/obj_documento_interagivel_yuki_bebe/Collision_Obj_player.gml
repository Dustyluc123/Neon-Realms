// --- Evento de Colisão com Obj_player ---

if (keyboard_check_pressed(ord("E")))
{
	// Só abre a janela se ela já não estiver aberta
	if (!instance_exists(obj_documento_viewer))
	{
		var _viewer = instance_create_layer(0, 0, "Instances", obj_documento_viewer); // Crie em uma camada de UI se tiver
		_viewer.sprite_para_mostrar = sprite_do_meu_documento;
	}
}