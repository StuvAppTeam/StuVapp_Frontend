desc "Holt Mensaplan von der Seezeitseite"

task :xml_parse => :environment do
  require 'nokogiri'
  require 'open-uri'

  xml = Nokogiri::XML(open("http://www.max-manager.de/daten-extern/seezeit/xml/mensa_friedrichshafen/speiseplan.xml"))


Mensa.delete_all

 xml.css('item').each do |i|
   children = i.children
   parent = i.parent
   timestamp = i.parent['timestamp'] + "000"
   category = children.css('category').inner_text
   title = children.css('title').inner_text
   price = children.css('preis1').inner_text

  
  @mensa = Mensa.new(
  :timestamp => timestamp,
  :category => category,
  :title => title,
  :price => price
  )
 @mensa.save 
  if @mensa.save
        puts "Success"
    else
        puts "Didn't work"
    end
end
end


