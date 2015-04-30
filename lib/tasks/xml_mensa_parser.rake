desc "Holt Mensaplan von der Seezeitseite"

task :xml_parse => :environment do
  require 'nokogiri'
  require 'open-uri'

  xml = Nokogiri::XML(open("http://www.max-manager.de/daten-extern/seezeit/xml/mensa_friedrichshafen/speiseplan.xml"))


Mensa.delete_all


xml.css('tag').each do |node|
  children = node.children
  childchild = children.children
  
  @mensa = Mensa.new(
  :timestamp => node['timestamp'],
  :category => childchild.css('category').inner_text,
  :title => childchild.css('title').inner_text,
  :price => childchild.css('preis1').inner_text
  )
 @mensa.save 
  if @mensa.save
        puts "Success"
    else
        puts "Didn't work"
    end
end

end


