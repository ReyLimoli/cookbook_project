require_relative "receita"

puts "Bem vindo ao CookBook! \n\n"

opcoes = 0
receitas = []
num = 0
while (opcoes != 3) do
    puts "MENU"
    puts "[1] Incluir uma receita"
    puts "[2] Ver todas as receitas"
    puts "[3] Sair"
    puts "\n\n"
    print "Digite a opção desejada: "    
    opcoes = gets().to_i
    puts
    if (opcoes == 1)   
        num = num + 1 
        @numero_receita = num
        puts "Opção escolhida: " + opcoes.to_s
        print "Digite o nome da sua nova receita: "
        descricao = gets().chomp()
        print "Digite o modo de preparo: "
        modo = gets().chomp()
        print "Digite o tipo de receita: "
        tipo = gets().chomp()

        nova_receita = Receita.new(descricao, modo, tipo)
        receita = nova_receita
        puts "Receita cadastrada: "
        receita.imprimir()
        
        receita = "##{ num.to_s } - #{ receita } "
        receitas << receita
        
    elsif (opcoes == 2)
        if (receitas.length == 0)
            puts "Você ainda não cadastrou nenhuma receita! \n\n"
        else
            puts "Estas são as receitas cadastradas: "
            puts receitas
            puts
        end        
    elsif (opcoes == 3)
        puts "Até Logo!"        
    else
        puts "Você não digitou uma opção válida. Vamos tentar novamente?"
        puts

    end    

end