class Receita
    
    attr_reader :numero_receita
    attr_writer :numero_receita 

    def initialize(desc, modo, tipo)
        @description = desc
        @mode = modo
        @type = tipo
        @numero_receita = 1
    end

    def imprimir()
        @impressao = "##{ @numero_receita.to_s } - #{ @description } - #{ @mode } - #{ @type } "
        puts  @impressao

    end

    def to_s()
        " #{ @description } - #{ @mode } - #{ @type } "
    end



end