// No evento Step de Obj_porta_tyler

// Se a porta NÃO deve estar a animar, força-a a ficar no frame 0.
// Este código anula qualquer outra tentativa de animar a porta.
if (animando == false)
{
    image_speed = 0;
    image_index = 0;
}
else // Se a porta DEVE estar a animar...
{
    // ...toca a animação normalmente.
    image_speed = 1;
    
    // E verifica se a animação terminou.
    // "image_number" contém o número total de frames da sprite.
    if (image_index >= image_number - 1)
    {
        // Trava no último frame e para de animar permanentemente.
        image_index = image_number - 1;
        image_speed = 0;
    }
}