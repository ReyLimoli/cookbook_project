require_relative "receita"

puts "Bem vindo ao CookBook! \n\n"

opcoes = 0
numero_contador = 0
receitas = []
modos = []
tipos = []

while (opcoes != 5) do
    puts "MENU"
    puts "[1] Incluir uma receita"
    puts "[2] Ver todas as receitas"
    puts "[3] Buscar receitas"
    puts "[4] Apagar receitas"
    puts "[5] Sair"
    puts "\n\n"
    print "Digite a opção desejada: "    
    opcoes = gets().to_i()
    puts
    if (opcoes == 1)            
        print "Digite o nome da sua nova receita: "
        descricao = gets().chomp().upcase()
        print "Digite o modo de preparo: "
        modo = gets().chomp()
        puts "[1] - Entrada \n[2] - Prato Principal \n[3] - Sobremesa"
        print "Escolha o tipo de receita: "
        sub_opcao = gets().chomp()
        tipo = ''
        opcao = sub_opcao.to_i

        if(opcao != 1 && opcao != 2 && opcao != 3)
            opcao = 0
            while (opcao != 1 && opcao != 2 && opcao != 3) do
                puts "Você não escolheu uma opção válida. \nPor favor, escolha uma opção."
                puts "[1] - Entrada \n[2] - Prato Principal \n[3] - Sobremesa"
                print "Escolha o tipo de receita: "
                sub_opcao = gets().chomp()
                opcao = sub_opcao.to_i                               
            end                               
        end 

        if (sub_opcao.to_i == 1)
            tipo = "Entrada"
        elsif (sub_opcao.to_i == 2)
            tipo = "Prato Principal"
        elsif (sub_opcao.to_i == 3)
            tipo = "Sobremesa"                  
        end
        nova_receita = Receita.new(descricao, modo, tipo)
        receitas << descricao
        modos << modo
        tipos << tipo
        puts "Receita de #{ descricao } cadastrada com sucesso!"
        puts                     
    elsif (opcoes == 2)
        contador = 0
        if (receitas.length() == 0)
            puts "Você ainda não cadastrou nenhuma receita! \n\n"
        else
            puts "Estas são as receitas cadastradas: "
            receitas.each() do |r|                
                numero = contador + 1
                puts "##{ numero.to_s() } - #{ receitas[contador] } - Tipo: #{ tipos[contador] } \nModo de preparo:    #{ modos[contador] }"                
                contador = contador + 1
                puts
            end
            puts
        end
    elsif (opcoes == 3)
        if (receitas.length() == 0)
            puts "Você ainda não cadastrou nenhuma receita! \n\n"
        else
            print "Digite a receita que deseja buscar: "
            busca = gets().chomp().upcase()
            puts
            achou = false
            contador = 0
            receitas.each do |i|
                numero = contador + 1          
                if (i.include?(busca))
                    puts "Resultado correspondente: ##{ numero.to_s() } - #{ receitas[contador] } - Tipo: #{ tipos[contador] } \nModo de preparo: #{ modos[contador] } "
                    puts
                    achou = true
                end
                contador = contador + 1                
            end
            if (achou == false)
            puts "Nenhum resultado correspondente a pesquisa! \n\n"
            end
        end

    elsif (opcoes == 4)
        contador = 0
        if (receitas.length() == 0)
            puts "Você ainda não cadastrou nenhuma receita! \n\n"
        else
            puts "Estas são as receitas cadastradas: \n"
            receitas.each() do |r|                
                numero = contador + 1
                puts "##{ numero.to_s() } - #{ receitas[contador] } - Tipo: #{ tipos[contador] } \nModo de preparo:    #{ modos[contador] }"                
                contador = contador + 1
                puts
            end
            print "Escolha o número da receita que deseja apagar: "
            apagar = gets().to_i()
            puts
            if (apagar > 0)
                apagar = apagar - 1
            else
                apagar = -1
            end            
            contador = 0
            validacao = false
            receitas.each() do |i|                
                if (apagar > contador)
                    contador = contador + 1
                elsif(apagar == contador)
                    puts "Tem certeza que deseja apagar a receita: #{ receitas[contador] }?"  
                    puts "[1] - Sim \n[2] - Não"
                    print "Apagar: "
                    certeza = gets().to_i()
                    if(certeza == 1)
                        puts "receita de #{ receitas[contador] } apagada com sucesso!"
                        receitas.delete_at(contador)
                        modos.delete_at(contador)
                        tipos.delete_at(contador)
                        validacao = true
                        contador = contador + 1                   
                    elsif(certeza == 2)
                        puts "Receita de #{ receitas[contador] } não apagada."
                        contador = contador + 1
                        validacao = true
                    else
                        puts "Opção inválida. Receita de #{ receitas[contador] } não apagada."
                        contador = contador + 1
                        validacao = true
                    end                    
                elsif (validacao == false)
                    puts "Opção inválida. Nenhuma número de receita correspondente."
                    validacao = true
                end
            end
            
            puts
        end        
    elsif (opcoes == 5)
        puts "Obrigado por utilizar o CookBook! Até Logo!"        
    else
        puts "Você não digitou uma opção válida. Vamos tentar novamente?"
        puts
        
    end

end