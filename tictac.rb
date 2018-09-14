class Game 
  attr_reader :tableroTamaño 
  attr_reader :tableroJuego
  attr_reader :tableroReferencia

  def initialize(tableroTamaño)
    @tableroTamaño = tableroTamaño
    @tableroJuego = []
    @tableroReferencia = []
  end

  def crearTablero
    # tableroArray = [Array.new(@tableroTamaño,0),Array.new(@tableroTamaño,0),Array.new(@tableroTamaño,0)]
    tableroArray = Array.new(@tableroTamaño)
    for i in 0...@tableroTamaño
      tableroArray[i] = Array.new(@tableroTamaño)
      for j in 0...@tableroTamaño
        tableroArray[i][j] = 0
      end
    end
    
    @tableroJuego = tableroArray
  end

  def crearTableroReferencia
    contador = 0
    tableroArray = Array.new(@tableroTamaño)
    for i in 0...@tableroTamaño
      tableroArray[i] = Array.new(@tableroTamaño)
      for j in 0...@tableroTamaño
        tableroArray[i][j] = contador
        contador += +1
      end
    end
    @tableroReferencia = tableroArray
  end

  def mostrarConsolaTableroJuego
    tableroJuego.each_with_index do |e, row, col| 
      puts "#{e}"
    end
  end

  def mostrarConsolaTableroReferencia
    tableroReferencia.each_with_index do |e, row, col|
      puts "#{e}"
    end
  end
  
  def inicioDeJuego
    crearTablero
    crearTableroReferencia
    mostrarConsolaTableroReferencia
    puts "/**************************/"
    mostrarConsolaTableroJuego
    puts "Inicio"
  end
end

# /////////////////INICIO DEL PROGRAMA////////////////

print "Teclea el numero de tamaño: "
tamañoSeleccionado = gets.chomp.to_i
juego1 = Game.new(tamañoSeleccionado)

puts "Tamaño de mi tablero es: Columnas: #{juego1.tableroTamaño}  Filas: #{juego1.tableroTamaño}"


# ////////////////INICIAR EL JUEGO /////////////////////////

juego1.inicioDeJuego