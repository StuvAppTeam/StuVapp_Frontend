desc "Holt Mensaplan von der Seezeitseite"
#
#   task :xml_parse do
#
#require 'nokogiri'
#require 'open-uri'
#
#doc = Nokogiri::XML(open("http://www.max-manager.de/daten-extern/seezeit/xml/mensa_friedrichshafen/speiseplan.xml"))
#
#  menus = doc.xpath('//tag')
#
#  menus.each do |menu|
#      @data = Mensa.new(
#        :timestamp            => menu.at('@timestamp').text,
#        :category       => menu.at('category').text,
#        :title       => menu.at('title').text,
#        :price       => menu.at('preis1').text,
#        )  
#
#
#    @data.save
#
#    if @data.save
#        puts "Success"
#    else
#        puts "Didn't work"
#    end
#    end
#    puts @data
#end

task :xml_parse => :environment do
  require 'nokogiri'
  require 'open-uri'

  xml = Nokogiri::XML(open("http://www.max-manager.de/daten-extern/seezeit/xml/mensa_friedrichshafen/speiseplan.xml"))

  #xml.xpath("//tag").each do |tag|
  #  %w[@timestamp category title preis1].each do |n|
  #    puts tag.at(n).text
  #  end
  #  
  #end
Mensa.delete_all

days = xml.search('tag').map do |tag|
  %w[ @timestamp category title preis1 ].each_with_object({}) do |n, o|
    o[n] = tag.at(n).text
  end
end


days.each {|item| item["title"].gsub!("&quot;","")}

days.each do |day|
  
      @mensa = Mensa.new(
        :timestamp            =>  day.values_at('@timestamp').to_s.gsub!("[","").gsub!("]",""),
        :category       => day.values_at('category').to_s.gsub!("[","").gsub!("]",""),
        :title       => day.values_at('title').to_s.gsub!("[","").gsub!("]",""),
        :price       => day.values_at('preis1').to_s.gsub!("[","").gsub!("]",""),
        )  

 @mensa.save

    if @mensa.save
        puts "Success"
    else
        puts "Didn't work"
    end
   
#require 'awesome_print'



#File.open("app/views/mensas/mensa.json","w") do |f|
#  f.write(days.to_json)

end
end


