// --- NOVO CÓDIGO para o Evento Step de Obj_dialogo ---

// SE o diálogo ainda não foi inicializado...
if (inicializado == false)
{
    // ...executa o script que preenche o grid com o texto.
    script_execute(Scr_texto);

    // Se, mesmo depois de executar o script, não houver texto, destrói-se para não travar o jogo.
    if (ds_grid_height(texto_grid) == 0) {
        instance_destroy();
        exit;
    }

    // Marca como inicializado para não executar esta parte de novo.
    inicializado = true;
}

// --- A sua lógica antiga para avançar o diálogo com a tecla 'E' continua aqui ---
if (keyboard_check_pressed(ord("E")))
{
    // (O seu código para avançar a 'pagina' ou destruir a instância vai aqui)
    // ...
}

// --- A sua lógica antiga do efeito "máquina de escrever" continua aqui ---
// (O seu código que aumenta a variável 'carac' a cada passo vai aqui)
// ...