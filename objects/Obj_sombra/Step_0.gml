// Evento Step de Obj_sombra

if (instance_exists(dono))
{
	// Se o dono existe, atualize a posição da sombra para ser a mesma do dono.
	x = dono.x;
	y = dono.y;
}
else
{
	// Se o dono não existe mais, a sombra não tem por que existir.
	instance_destroy();
}