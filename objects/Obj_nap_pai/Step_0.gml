// Alternativa para o Evento Step de obj_nap_pai

if (global.falou_com_pai == true)
{
    solid = false;
    
    // Faz o pai andar para o lado até uma posição segura (ex: x = 500)
    var _x_alvo = 500; 
    if (x < _x_alvo)
    {
        x += 1; // Velocidade do pai andando para a direita
        // Aqui você pode até mudar o sprite dele para o de "andando"
    }
}