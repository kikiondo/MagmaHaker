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
    puts "Tablero del juego original"
    tableroJuego.each_with_index do |e, row, col| 
      puts "#{e}"
    end
  end

  def mostrarConsolaTableroReferencia
    puts "Tablero con las posiciones para guiarlos"
    tableroReferencia.each_with_index do |e, row, col|
      puts "#{e}"
    end
  end
  
  def getPosition(posicion, tableroReferencia)
    for f in 0..tableroReferencia.size
      for g in 0..tableroReferencia.size
        if tableroReferencia[f][g] == posicion
          return [f],[g]
        end
      end
    end
  end
  
  def inicioDeJuego
    jugador1 = "x"
    jugador2 = "o"
    turno = 0

    crearTablero
    crearTableroReferencia

    puts "Preparence juagdores ._.)/: "   
    
   loop do
      puts "*******************************"
      puts "Hola mi mahy #{turno}"
    
      if turno % 2 == 0
        mostrarConsolaTableroReferencia
        mostrarConsolaTableroJuego
        puts "¿En donde quieres colocar tu figura jugador 1?"
        posicion = gets.chomp.to_i
        posiciones = getPosition(posicion, @tableroReferencia)

        x = posiciones[0][0]
        y = posiciones[1][0]

        if @tableroJuego[x][y] == "x" || @tableroJuego[x][y] == "o"
          puts "esta posicion ya esta en uso"
        else
            @tableroJuego[x][y] = jugador1
            turno = turno + 1
        end
      end

      if turno % 2 != 0
        mostrarConsolaTableroReferencia
        mostrarConsolaTableroJuego
        puts "¿En donde quieres colocar tu figura jugador 2?"
        posicion = gets.chomp.to_i
        posiciones = getPosition(posicion, @tableroReferencia)

        x = posiciones[0][0]
        y = posiciones[1][0]

        if @tableroJuego[x][y] == "x" || @tableroJuego[x][y] == "o"
          puts "esta posicion ya esta en uso"
        else
            @tableroJuego[x][y] = jugador2
            turno = turno + 1
        end
      end

      if(turno == (@tableroTamaño*@tableroTamaño))
        break
      end

    end
  end
end

# /////////////////PREPARACIÓN DEL JUEGO////////////////

print "Teclea el numero de tamaño: "
tamañoSeleccionado = gets.chomp.to_i
juego1 = Game.new(tamañoSeleccionado)

puts "Tamaño de mi tablero es: Columnas: #{juego1.tableroTamaño}  Filas: #{juego1.tableroTamaño}"


# ////////////////INICIAR EL JUEGO /////////////////////////

juego1.inicioDeJuego