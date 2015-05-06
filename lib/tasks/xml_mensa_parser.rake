desc "Holt Mensaplan von der Seezeitseite"

task :xml_parse => :environment do
  require 'nokogiri'
  require 'open-uri'

#Laden des XML-files
  xml = Nokogiri::XML(open("http://www.max-manager.de/daten-extern/seezeit/xml/mensa_ravensburg/speiseplan.xml"))

#Leeren des Models, damit die aktuellen zwei Wochen geladen werden können
Mensa.delete_all

#XML Datei auslesen und Werte an Variablen übergeben
 xml.css('item').each do |i|
   children = i.children
   parent = i.parent
   timestamp = i.parent['timestamp'] + "000"
   category = children.css('category').inner_text
   title = children.css('title').inner_text
   price = children.css('preis1').inner_text

 #Die neuen Datensätze an das Model übergeben und anschließend im Model speichern 
  @mensa = Mensa.new(
  :timestamp => timestamp,
  :category => category,
  :title => title,
  :price => price
  )
 @mensa.save 
 #Prüfung ob die Speicherung der neuen Daten erfolgreich war
  if @mensa.save
        puts "Success"
    else
        puts "Didn't work"
    end
end
end


