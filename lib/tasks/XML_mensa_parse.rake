desc "Fetch product prices"
task :xml_parse do
  require 'nokogiri'
  require 'open-uri'

  xml = Nokogiri::XML(open("http://www.max-manager.de/daten-extern/seezeit/xml/mensa_friedrichshafen/speiseplan.xml"))

  xml.xpath("//tag").each do |tag|
    %w[@timestamp category title preis1].each do |n|
      puts tag.at(n).text
    end
  end

end