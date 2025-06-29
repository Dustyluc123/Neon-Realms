// --- CÓDIGO PARA O EVENTO STEP ---

// Se a porta recebeu a ordem para animar...
if (animando == true)
{
    // ...toca a animação.
    image_speed = 1;

    // E verifica se a animação chegou ao fim.
    if (image_index >= image_number - 1)
    {
        // Se chegou, trava no último frame e para de animar para sempre.
        image_index = image_number - 1;
        image_speed = 0;
        animando = false; // Define como falso para não entrar aqui de novo
    }
}