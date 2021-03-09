#!/usr/bin/env ruby
require 'spreadsheet'
##############################
$nombre_definitivo = "ERROR"
$titulo_definitivo = "ERROR"
$genero_definitivo = "ERROR"
$imagen_definitivo = "ERROR"
$director_definitivo = "ERROR"
$audio_definitivo = "ERROR"
$subtitulos_definitivo = "ERROR"
$descripcion_definitivo = "ERROR"

$temporadas = 'Todas'
$calidad_definitivo = '720p'
$tiene_subtitulos = 'Si'

$numero_de_fila = 1
################################
def nombre
    puts "############(0/7) COMPLETADO)############"
    puts "Escribí el NOMBRE DE LA SERIE (unicamente)"
    puts "e.g.: FRIENDS"
    puts "e.g.: How I Met Your Mother"
    puts "########################################"
    a = gets.chomp()
    puts "El nombre es:\n#{a}"
    puts "Es correcto?"
    puts "a) Sí\nb) No"
    b = gets.chomp()
    if (b != "a")
    nombre
    else
        return $nombre_definitivo = a
    end
end

def imagen
    a = ''
    puts ""
    puts "############(1/7) COMPLETADO)############"
    puts "Agregá la IMAGEN"
    puts "########################################"
    puts "Tiene que ser subida a https://postimages.org/es/"
    puts "Hay que copiar la que termina en PNG (DIRECT LINK)"
    puts "e.g.: https://i.postimg.cc/2y5CRtJ7/logo-ig.png"
    a = gets.chomp()

    def imagen_fail
        puts "#############################################"
        puts "No tiene PNG, o no dice postimg.cc."
        puts "Volvé a probar el link. Hay que copiarlo entero"
        puts "e.g.: https://i.postimg.cc/2y5CRtJ7/logo-ig.png"
        puts "#############################################"
        b = gets.chomp()
        if !b.include? ".png" && "postimg.cc"
            imagen_fail
        else
            return a = b
        end
    end

        if !a.include? ".png" && "postimg.cc"
            imagen_fail
        end
    return $imagen_definitivo = a
end

def genero 
    a = ''
    puts ""
    puts "############(2/7) COMPLETADO)############"
    puts "Elegí el GENERO"
    puts "########################################"
    puts "a)Comedia\nb)Drama\nc)Acción\nd)Terror\ne)Suspenso"
    a = gets.chomp()
    case a
    when "a"
        $genero_definitivo = "Comedia"
    when "b" 
        $genero_definitivo = "Drama"
    when "c" 
        $genero_definitivo = "Accion"
    when "d" 
        $genero_definitivo = "Terror"
    when "e" 
        $genero_definitivo = "Suspenso"
    else
        puts "No elegiste ninguna de las opciones."
        genero
    end
end

def director
    puts "############(3/7) COMPLETADO)############"
    puts "Escribí el NOMBRE y APELLIDO de quien la DIRIGE"
    puts "e.g.: Ann Druyan"
    puts "########################################"
    a = gets.chomp()
    puts "El nombre es:\n#{a}"
    puts "Es correcto?"
    puts "a) Sí\nb) No"
    b = gets.chomp()
    if (b != "a")
    director
    else
        return $director_definitivo = a
    end
end

def audio 
    a = ''
    puts ""
    puts "############(4/7) COMPLETADO)############"
    puts "Elegí el IDIOMA DE AUDIO"
    puts "########################################"
    puts "a)Inglés\nb)Español\nc)Francés\nd)Alemán"
    a = gets.chomp()
    puts "Escirbiste #{a}"
    case a
    when "a"
        $audio_definitivo = "Inglés"
    when "b" 
        $audio_definitivo = "Español"
    when "c" 
        $audio_definitivo = "Francés"
    when "b" 
        $audio_definitivo = "Alemán"
    else
        puts "No elegiste ninguna de las opciones."
        audio
    end
end

def subtitulos 
    a = ''
    puts ""
    puts "############(5/7) COMPLETADO)############"
    puts "Elegí el IDIOMA DE SUBTITULOS"
    puts "########################################"
    puts "a)Inglés\nb)Español\nc)Francés\nd)Alemán\ne)No tiene subtítulos"
    a = gets.chomp()
    puts "Escirbiste #{a}"
    case a
    when "a"
        $subtitulos_definitivo = "Inglés"
    when "b" 
        $subtitulos_definitivo = "Español"
    when "c" 
        $subtitulos_definitivo = "Francés"
    when "d" 
        $subtitulos_definitivo = "Alemán"
    when "e" 
        $subtitulos_definitivo = "No aplica"
    else
        puts "No elegiste ninguna de las opciones."
        subtitulos
    end
end

def descripcion 
        puts ""
        puts "############(6/7) COMPLETADO)############"
        puts "DESCRIPCION, PREMIOS, CANTIDAD DE TEMPORADAS, CALIDAD. Esta subtitulada?"
        puts "########################################"
        puts "Cuantas temporadas tiene? Solo NUMERO"
        puts "e.g.: 10"
        $temporadas = gets.chomp().gsub(/[^0-9,.]/, "")

        def calidad
                puts ""
                puts "Cual es la Calidad?"
                puts "a)1080p\nb)720p\nc)480p\n"
                a = gets.chomp()
                puts "Escirbiste #{a}"
                case a
                when "a"
                    $calidad_definitivo = "1080p"
                when "b" 
                    $calidad_definitivo = "720p"
                when "c" 
                    $calidad_definitivo = "480p"
                else
                    puts "No elegiste ninguna de las opciones."
                    calidad
                end
        end

        def subs
            puts ""
            puts "Es subtitulada?"
            puts "a)Si\nb)No (audio Español/Español latino/Castellano)"
            a = gets.chomp()
            case a
            when "a"
                $tiene_subtitulos = "Si"
            when "b" 
                $tiene_subtitulos = "No"
            else
                puts "No elegiste ninguna de las opciones."
                subs
            end
        end

        calidad
        subs
        puts ""
        puts ""
        puts "Copia la descripción de FILMAFFINITY\nSin incluir \"Serie de TV (xxxx-xxxx) Y temporadas Z Episodios ni FILMAFFINITY al final.\"\ne.g.: https://i.postimg.cc/TYtfZPhb/imagen.png"
        puts "Pegala en https://www.browserling.com/tools/remove-accents para remover acentos (e.g.:https://i.postimg.cc/154V7XKg/imagen.png)"
        puts "v1.0.1 (09/03/2021) sino, simplemente abri el excel y pegala en la celda"
        $filmaffinity = gets
        # puts ""
        # puts ""
        # puts "Copia y pega los premios de FILMAFFINITY\ne.g.: https://i.postimg.cc/NjWqc2tK/imagen.png"
        # $premios = gets.chomp()
        puts "Cantidad de Temporadas: #{$temporadas}\nLa calidad es #{$calidad_definitivo}\nTiene subtítulos?: #{$tiene_subtitulos}"

        puts "ESTA TODO OK?\na)Si\nb)No, quiero cambiar algo"
        x = gets.chomp()
        if (x != "a")
            descripcion
        end

    if $tiene_subtitulos == "Si"
        $descripcion_definitivo = 
        "#{$nombre_definitivo.upcase} - #{$temporadas} Temporadas
        / / / / / / / / / / / / / / / / / / MANUEL SERIES / / / / / / / / / / / / / / / / / / / / / / 
        -------------------------------------------------------------------------------------
        #{$filmaffinity}
        -------------------------------------------------------------------------------------
        SERIE SUBIDA POR MI - NADA DE LINKS A PAGINAS DUDOSAS - ES EL HOSTING #1 DEL MUNDO - COMPRA UN SERVICIO CONFIABLE - Sin límite de descarga, y sin límite de tasa de descarga - DESCARGA TODOS LOS QUE QUIERAS A LA VELOCIDAD MAXIMA
        ¡COMPRA UNA VEZ Y TIENE LA SERIE PARA SIEMPRE!
        Sin ads, sin links caidos, sin audio o subtitulo distinto. Paga una vez y ve tranquilamente por siempre.

        ¡¡SIMPLE como clickear en el link y empezar a ver!! NO es necesario descargar (aunque también es una opción) - Subtítulos incluidos!

        Idioma #{$audio_definitivo}
        Subtitulada al castellano
        Version HD #{$calidad_definitivo}

        Formato: MKV
        Fuente de Video: DVDRip
        Fuente de Audio: DVDRip
        Resolución: #{$calidad_definitivo}
        Entrega Digital por Correo Electrónico y al ALMACENAMIENTO #1 DEL MUNDO al mismo tiempo.

        Fácil de reproducir: sólo clickear y ver! - SUBTITULOS INCORPORADOS!

        Si el cliente lo desea, se le puede enviar un episodio de muestra para que confirme la calidad del producto. ¡Consulte en las preguntas por el episodio de prueba!

        ¡Consulte por otras series o películas!\n"

        else
            $descripcion_definitivo = 
            "#{$nombre_definitivo.upcase} - #{$temporadas} Temporadas
            / / / / / / / / / / / / / / / / / / MANUEL SERIES / / / / / / / / / / / / / / / / / / / / / / 
            -------------------------------------------------------------------------------------
            #{$filmaffinity}
            -------------------------------------------------------------------------------------
            SERIE SUBIDA POR MI - NADA DE LINKS A PAGINAS DUDOSAS - ES EL HOSTING #1 DEL MUNDO - COMPRA UN SERVICIO CONFIABLE - Sin límite de descarga, y sin límite de tasa de descarga - DESCARGA TODOS LOS QUE QUIERAS A LA VELOCIDAD MAXIMA
            ¡COMPRA UNA VEZ Y TIENE LA SERIE PARA SIEMPRE!
            Sin ads, sin links caidos, sin audio distinto. Paga una vez y ve tranquilamente por siempre.
        
            ¡¡SIMPLE como clickear en el link y empezar a ver!! NO es necesario descargar (aunque también es una opción)
        
            Idioma #{$audio_definitivo}
            Version HD #{$calidad_definitivo}
        
            Formato: MKV
            Fuente de Video: DVDRip
            Fuente de Audio: DVDRip
            Resolución: #{$calidad_definitivo}
            Entrega Digital por Correo Electrónico y al ALMACENAMIENTO #1 DEL MUNDO al mismo tiempo.
        
            Fácil de reproducir: sólo clickear y ver! 

            Si el cliente lo desea, se le puede enviar un episodio de muestra para que confirme la calidad del producto. ¡Consulte en las preguntas por el episodio de prueba!
        
            ¡Consulte por otras series o películas!\n"
    end
end

def titulo
    puts "############(7/7 COMPLETADO)############"
    puts "TITULO DE LA PUBLICACION"
    puts "########################################"
    a = $nombre_definitivo
    # puts "\n #{$nombre_definitivo} son #{a.length()} caracteres\n"
    # puts "Calidad:#{$calidad_definitivo}\nTiene subs: #{$tiene_subtitulos}"
    if a.length() < 44 
        if a.length() < 25 && $calidad_definitivo == "720p" && $tiene_subtitulos == "Si"
            return $titulo_definitivo = "#{a} - HD - SUBTITULADA - MANUEL SERIES"
        elsif a.length() < 25 && $calidad_definitivo == "720p" && $tiene_subtitulos == "Si"
            return $titulo_definitivo = "#{a} - HD - SUBTITULADA - MANUEL SERIES"
        elsif a.length() < 39 && $calidad_definitivo == "720p"
            return $titulo_definitivo = "#{a} - HD - MANUEL SERIES"
        elsif a.length() < 39 && $calidad_definitivo == "1080p"
            return $titulo_definitivo = "#{a} - HD - MANUEL SERIES"
        end
    return $titulo_definitivo = "#{a} - MANUEL SERIES" 
    else 
        puts "El nombre es de más de 44 caracteres. Pifiaste?"
        nombre
        titulo
    end
end

puts "\nCreador de series de Cratag\n\n"
nombre
imagen
genero
director
audio
subtitulos
descripcion
titulo

row_1 = [
    $titulo_definitivo, 
    'No aplica',
    $imagen_definitivo,
    '',
    '6',
    '549', #PRECIO ARG
    'Nuevo',
    $descripcion_definitivo,
    '',
    'Clásica',
    'Mercado Envíos',
    'A cargo del comprador',
    'Acepto',
    'Garantía del vendedor',
    '14',
    'días',
    'Digital',
    $genero_definitivo,
    $nombre_definitivo,
    $director_definitivo,
    'Todas las temporadas',
    '1',
    'Digital',
    $subtitulos_definitivo,
    $audio_definitivo,
    'No',
    'No aplica'
]

new_book = Spreadsheet::Workbook.new
new_book.create_worksheet :name => 'SERIES - PEGAR EN ARG'
new_book.worksheet(0).insert_row(0, row_1)
new_book.write('SERIES NUEVAS.xls')