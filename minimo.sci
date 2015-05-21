function result = minimo();
	//======== 0 - Configuracoes iniciais ============
	tamCrom = 9;
	taxaCross = 65;
	taxaMutacao = 1;
	nIndiv = 50;
    for i=1:nIndiv
        for j=1:tamCrom*2
            newPop(i,j) = 0;
        end
    end
    
	//======== 1 - Gerar população inicial ==========
	populacao = popInicial(nIndiv, tamCrom);

	//======== 2 - Avaliar os indivíduos ============
	[maxApt,aptRel] = aptidao(populacao, tamCrom);

	for i=1:200
		for j=1:nIndiv/2
			//======== 3 - Seleção por roleta ============
			indSort = roleta(aptRel);

			//======== 4 - Selecionar novos individuos para populacao ========
			//======== 4.1 - Crossover ======================================
			filho = crossover(populacao, indSort, taxaCross, tamCrom);

			//======== 4.2 - Mutaçao ========================================
			filhos = mutacao(filho, tamCrom, taxaMutacao);
            
            for k=1:tamCrom*2
                newPop(j,k) = filhos(1,k);
			    newPop(j+nIndiv/2,k) = filhos(2,k);
            end
		end
		populacao = filhos;
		[maxApt,aptRel] = aptidao(populacao, tamCrom);
	end

	result = maxApt;

endfunction