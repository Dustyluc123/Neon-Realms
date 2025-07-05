// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_texto(){

  switch npc_nome{
	  
	  case "Tyler":
	  
	    ds_grid_add_text("Graças a Deus acordou dorminhoco, você disse que gostaria de ir a academia de polícia comigo hoje não é? ", Spr_retrado_tyler_fofo, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("Eu só não sabia que teria que acordar tão cedo...", Spr_retrado_yuki_sono, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Bem vindo ao mundo adulto garoto. Bem pegue seu crachá de acompanhante e vamos sair, vou te esperar lá fora.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("Ah... Ok, onde você deixou?", Spr_retrado_yuki_sono, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Não lembro hahaha, é bom que você pode dar uma rodada pela casa.", Spr_retrado_tyler_oque, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("É como eu sempre digo, conheça seu lar e conhecerá todo o universo.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("Essa frase nem faz sentido pai.", Spr_retrado_yuki_surpreso, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Hahaha. Falando em frases que não fazem sentido. Uma conhecida sempre me dizia que voce pode clicar E para interagir, eu nunca entendi o que significa.", Spr_retrado_tyler_duvida, 1, "Tyler", Spr_dialogo_1);
		ds_grid_add_text("Mas que tal você dar uma 'interagida' pela casa em filho?", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text("É... a gente não tava com pressa?", Spr_retrado_yuki_surpreso, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Eu nuca chego no horário mesmo. ", Spr_retrado_tyler_ciumes, 1, "Tyler", Spr_dialogo_1);
        ds_grid_add_text(". . . que?", Spr_retrado_yuki_surpreso, 0, "Yuki", Spr_dialogo);
        break;
	 
  }
  
     switch npc_nome{
	  case "Espelho":
        ds_grid_add_text("Por algum motivo eu não consigo me ver nessas coisas, parece preguiça do criador eu não me ver nisso. Talvez eu seja um vampiro", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;	  
  }
  switch npc_nome{
	  case "Tv_2":
        ds_grid_add_text("A tv anda bem diferente depois do começo da guerra... queria saber como era antes.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;	  
  }
  switch npc_nome{
	  case "Guarda":
        ds_grid_add_text("Eu devia trocar de roupa para sair... Como se eu tivesse outra roupa.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;	  
  }
    switch npc_nome{
	  
case "Cama":
        ds_grid_add_text("Minha cama, o lugar onde encontro descanso e paz. Mas estou tendo pesadelos recorrentes com fogo . . . muito fogo.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;
   }
   switch npc_nome{
	  
case "Discos":
        ds_grid_add_text("Música 1-  O único problema dessa música é que ela nunca está alta o suficiente.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
     
        ds_grid_add_text("Música 2- Essa é a favorita do meu pai, sinto que ele sempre estará comigo enquanto eu escutar essa música.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;
   }
   
   
   switch npc_nome{
	  
	   
// Exemplo de como fica o seu switch no Scr_texto

case "Poster_0": // O que ele diz na primeira vez (estado 0)
    ds_grid_add_text("Barvel vs Pc A luta sobre heróis e computadores malignos.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
    break;
case "Poster_1": // O que ele diz sempre depois da segunda vez (estado 2)
    ds_grid_add_text("Capitão Canadá: Guerra, se viu? Eu não vi, obrigado por perguntar.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
    break;
	case "Poster_2": // O que ele diz sempre depois da segunda vez (estado 2)
    ds_grid_add_text("Capitão Canadá: Guerra, se viu? Eu não vi, obrigado por perguntar.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
    break;
	  
  }
  
   switch npc_nome{
	  
	    case "Guitarra":
        ds_grid_add_text("Essa é autografada pelo própio Rey o guitarrista dos Granadas! Meu pai está me ensinando a tocar mas eu não sou tão bom quanto ele.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;

	  
  }
    switch npc_nome{
	  
	    case "Brinquedo":
        ds_grid_add_text("É um morcego de pelúcia, ja dormi com ele em noites de tempestades.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;

	  
  }
  switch npc_nome{
	  
	    case "Robo_yuki_1":
        ds_grid_add_text(" Ei Yuki! Por que acordar tão cedo?", Spr_retrado_rabisco_confuso, 1, "Rabisco", Spr_dialogo_2);
		ds_grid_add_text("Vou com o pai até a academia de polícia, quer ir junto Rabisco?", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
		ds_grid_add_text("Eu? Eu até iria mas tenho medo de ir lá fora", Spr_retrado_rabisco_triste_1, 1, "Rabisco", Spr_dialogo_2);
		ds_grid_add_text("Se mudar de ideia é só me dizer!", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
		
        break;
		
	    case "Robo_yuki_2":
        ds_grid_add_text(" Vou ficar por aqui, mas pode ir se divertir", Spr_retrado_rabisco_normal, 1, "Rabisco", Spr_dialogo_2);
        break;

	  
  }

switch (npc_nome)

{
  
  case "porta_tyler_trancada":
        ds_grid_add_text("Está trancado...", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        ds_grid_add_text("Preciso da chave do quarto do Tyler.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;
        
    case "porta_saida_trancada":
        ds_grid_add_text("Não posso sair sem crachá, se não o Tyler me mata.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo)
        break;
        
    case "apanhei_chave_tyler":
        ds_grid_add_text("Apanhei a chave do quarto do Tyler.", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;
        
    case "apanhei_chave_casa":
        ds_grid_add_text("É minha banheira. . .", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
		 ds_grid_add_text("É só uma banheira mesmo", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
		  ds_grid_add_text("O que eu esperava interagindo aqui?", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
		  ds_grid_add_text("Calma . . .", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
		  ds_grid_add_text("É o crachá, o que tava fazendo aqui? ", Spr_retrado_yuki_normal, 0, "Yuki", Spr_dialogo);
        break;
}

switch (npc_nome)
{
  
 case "Elisa":
  ds_grid_add_text("Então, filho, o que você quer fazer agora?", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
    // A última linha é uma escolha!
    ds_grid_add_choice(
        "Vamos para a academia.", "dialogo_academia",
        "Acho que vou explorar mais um pouco.", "dialogo_explorar",
        "Na verdade, quero dormir mais.", "dialogo_dormir"
    );
    break;

// Respostas possíveis
case "dialogo_academia":
    ds_grid_add_text("Ótima escolha! Vamos.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
    break;

case "dialogo_explorar":
    ds_grid_add_text("Sem problemas. Tenha cuidado por aí.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
    break;

case "dialogo_dormir":
    ds_grid_add_text("Hahaha, preguiçoso como sempre.", Spr_retrado_tyler_normal, 1, "Tyler", Spr_dialogo_1);
    break;
}


}
function ds_grid_add_row(){
	///@arg ds_grid
 
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);	
}
// --- CÓDIGO ATUALIZADO para a função ds_grid_add_text no seu Scr_texto ---

// --- ATUALIZE a sua ds_grid_add_text ---

function ds_grid_add_text(){
	///@arg texto, retrato, lado, nome, caixa_sprite
	var _grid = texto_grid;
	var _y = ds_grid_add_row(_grid);
    
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
    _grid[# 4, _y] = argument[4];
    
    _grid[# 5, _y] = "fala"; // <<< ADICIONE APENAS ESTA LINHA
}
// --- ADICIONE ESTA NOVA FUNÇÃO ao seu Scr_texto ---

// Função para adicionar uma linha que contém escolhas para o jogador
// --- ADICIONE ESTA NOVA FUNÇÃO ao seu Scr_texto ---

// Função para adicionar uma linha que contém escolhas para o jogador
// No seu Scr_texto
function ds_grid_add_choice() {
    var _grid = texto_grid;
    var _y = ds_grid_add_row(_grid);

    _grid[# infos.TipoDeLinha, _y] = "escolha";

    var _opcoes = [];
    for (var i = 0; i < argument_count; i += 2) {
        array_push(_opcoes, { texto: argument[i], alvo: argument[i+1] });
    }
    _grid[# infos.DadosDaEscolha, _y] = _opcoes;

    // --- LINHAS ADICIONADAS ---
    // Preenche as outras colunas com valores vazios para segurança
    _grid[# infos.Texto, _y] = "";
    _grid[# infos.Retrato, _y] = -1; // -1 significa "nenhum sprite"
    _grid[# infos.Lado, _y] = 0;
    _grid[# infos.Nome, _y] = "";
    _grid[# infos.CaixaDeDialogo, _y] = Spr_dialogo_choise; // Uma caixa de diálogo padrão
}

