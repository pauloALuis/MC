% Opção B – Resolver a heurística:
% Se o utilizador ainda não tiver executado a Opção A o programa deverá
% pedir-lhe para o fazer. Em seguida o programa calcula o resultado
% obtido através da Heurística e apresenta-o.


%inicializa as variaveis
global P;
P = pedaladas;
%nome dos ciclistas
ciclistas = ["A. Ramos","J. Gomes" ,"S. Gomis" ,"J. Serra","R. Pires" ,"L. Blanco","S. Botero","R. Bolos", "J. Blasco","M.Basto","J. Cuenca"];

%numero de pares que devem ser formados
numCiclSelecionar = 5;
%v = intmax('uint64') %MAXIMO VALOR
 disp("Antiga Matriz: ")
 disp(P)
try
    %
    checkOut = 0;
    checkIncrement = 0;

    MAX=0;
    
    pares = strings(1,numCiclSelecionar)
    
   lin = 0;
   col = 0;



    while ~(all(checkOut >= numCiclSelecionar))
        
        for linha=1:numLinhas
            for coluna=1:numColunas
                if MAX < P(linha,coluna)
                    MAX = P(linha,coluna);
                    
                    %coordenada que vão ser eliminadas
                    lin= linha;
                    col= coluna;
                    checkIncrement = 1;
                    %atualiza a lista de selecionados pares - com nomes
                    pares(linha)= strcat('(', int2str(linha)," - " ,ciclistas(linha), ", ",ciclistas(coluna)," - " ,int2str(coluna),')');
                end
            end
            MAX=0;
   

            
            deleteIJ(lin, col);
            %verifica se o 
            if(checkOut > numCiclSelecionar)
                break
            elseif checkIncrement == 1
                %Verifica se foi achado  algum par se sim então incrimenta 
                 checkOut = checkOut + 1;
           end
            checkIncrement = 0
        end

    end
    
    %mostrar o resultado
    disp("Pares Selecionados")
    
    for k = 1:length(pares)
      fprintf('%s\n', pares{k});
       %     fprintf('%s\n', pares{k});

    end
catch
    fprintf('Erro ao realizar/execução da heuristica !\n');
end

%Função para eliminar linha e coluna já selecionadas
function deleteIJ(i, j)
    try
        global P;
         for l=1:11
               P(i, l) = -1;
               P(l, i) = -1;
               
               P(j, l) = -1;
               P(l, j) = -1;
         end
    catch
        fprintf('Erro ao apagar Linha e Coluna!\n');
    end
end