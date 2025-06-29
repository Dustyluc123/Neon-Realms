// --- CÓDIGO PARA O EVENTO STEP de Obj_Porta_Trancavel ---

// Se a porta foi destrancada e a sua animação ainda não começou...
// (Verificamos image_speed para garantir que isto só acontece uma vez)
if (trancada == false && image_speed == 0)
{
    // ...começa a tocar a animação de abertura.
    image_speed = 1;
}

// Se a porta já está a animar
if (image_speed > 0)
{
    // E a animação chegou ao fim
    if (image_index >= image_number - 1)
    {
        // Trava no último frame para sempre
        image_index = image_number - 1;
        image_speed = 0;
    }
}