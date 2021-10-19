%Op��o T � Sair do programa:
%Esta op��o termina a execu��o do programa (mas n�o a do Matlab).
% Ao ser seleccionada o programa apresentar� uma mensagem pedindo ao 
% utilizador para confirmar se deseja efectivamente terminar a execu��o 
% (usando caracteres S/N mai�sculos ou min�sculos). 
% Se a op��o for sim o programa termina, se for n�o o programa volta a apresentar o menu.


executouLerDados = false;
ENTER = 13; % string com a mudan�a de linha ENTER = char(13)
while true % repetir at� obter indica��o para terminar 
	prompt = strcat('Menu', ENTER, ' A - Seleccionar ficheiro de dados', ENTER, ' B � Correr Heur�stica', ENTER,' T - Terminar o programa', ENTER, 'Escolha uma opcao:');
	txt = input(prompt, 's');
	choice = upper(txt); % Converte string em uppercase
	switch choice
		  case 'A'
			  LerDados;
              executouLerDados = true;
		  case 'B'
              % Se o utilizador ainda n�o tiver executado a Op��o A o programa dever� pedir-lhe para o fazer
              if executouLerDados == false
                  disp('Aten��o: a Op��o "A" deve ser executada primeiro.');
              else
                  disp('Tentar heuristica.'); 
                  %executar a Heuristica
                  Heuristica;
              end
		  case 'T' % 't' ou 'T'
              confirmar = input('Deseja efectivamente terminar a execu��o? S/N', 's');
              res = upper(confirmar);
              if res == 'S'
                  return; % termina a execu��o do programa (mas n�o a do Matlab)
                  % para sair do Matlab invocar a fun��o 'exit' ou 'quit'
              end
	end
end