// No evento de Colisão do Obj_player com o obj_nap_pai

// --- Parte 1: Interação ---
// Verifica se o jogador quer interagir (apertou 'E')
if (keyboard_check_pressed(ord("E")))
{
	// Só inicia o diálogo se já não houver outro na tela
	if (!instance_exists(Obj_dialogo))
	{
		// Inicia o diálogo com o pai
		IniciarDialogo("dialogo_do_pai_inicio"); // Use a sua chave de diálogo correta aqui

		// ATIVA A TRAVA: Assim que a conversa começa, marcamos que ela aconteceu.
		global.falou_com_pai = true;
	}
}

// --- Parte 2: Bloqueio Físico ---
// Se o pai ainda for sólido, esta parte impede que o jogador o atravesse.
// (Esta parte pode ser desnecessária se o seu sistema de movimento já lida bem com sólidos,
// mas é uma garantia extra para que o jogador não fique "preso" dentro do pai).
// Se você usa o sistema de física do GameMaker, pode precisar ajustar isso.