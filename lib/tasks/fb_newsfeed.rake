desc "Download des Newsfeeds der DHBW Ravensburg und StuV"

task :fb_newsfeed => :environment do
  require 'koala'


  # Laden des benötigten Authorisierungstokens für den Facebook Zugriff
  # Authentifizierung findet über AppId und AppSecret statt (Abrufbar im Facebook Developer Bereich)
  @oauth = Koala::Facebook::OAuth.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"])
  oauth_access_token = @oauth.get_app_access_token
  @graph = Koala::Facebook::API.new(oauth_access_token)


  # Laden des Facebook Feeds der DHBW, Zeitraum ist ein Monat, Datumsformat ist Unixzeit
  feed = @graph.get_connections("DHBWRAVENSBURG", "feed",{since: 1.month.ago.to_i, date_format: :U})
  # Leeren des bisherigen Datenbestands
  DhbwNews.delete_all

  feed.each do |feeds|

    # Prüfung, ob ein Objekt abrufbar ist
    if feeds.has_key?("object_id")
    # Abrufen der Metadaten zum Prüfen, ob ein Event vorliegt
    event = @graph.get_object(feeds.values_at('object_id')[0],{metadata: 1, fields: "metadata"}).values_at("metadata")
    else
      event= {}
    end


    # Prüfung, ob ein Event vorliegt oder nicht
    # Notwendig, da für Events das "Coverpicture" geladen werden muss, um ein anzeigbares Format zu haben
    if event != {} && event[0].values_at("type")[0] == "event"
      #Wenn Event vorliegt, abrufen des Cover Bilds
      cover =  @graph.get_object(feeds.values_at('object_id')[0],{fields: "cover"}).values_at("cover")
      picture = cover[0].values_at("source")[0]
    else
      picture = @graph.get_picture(feeds.values_at('object_id')[0])
    end

    # Unterscheidung zwischen normalem Text und Beschreibun eines Bilds oder Events
    if !feeds.values_at('message')[0]
      message = feeds.values_at('description')[0]
    else
      message = feeds.values_at('message')[0]
    end

    # Speichern der geladenen Werte im Model
    @dhbw_news = DhbwNews.new(
        :feedId         => feeds.values_at('id')[0],
        :message        => message,
        :picture        => picture,
        :link           => feeds.values_at('link')[0],
        :feedDate       => Time.at(feeds.values_at('created_time')[0]).to_datetime
    )

    # Persistieren der Werte
    @dhbw_news.save

  end


  # Laden des Facebook Feeds der StuV
  # Syntax und Funktionsweise gleich dem Laden des DHBW Feeds
  # Kommentare siehe andere Funktion
  feed = @graph.get_connections("stuvrav", "feed",{date_format: :U})
  feed.each do |feeds|

    if feeds.has_key?("object_id")
      event = @graph.get_object(feeds.values_at('object_id')[0],{metadata: 1, fields: "metadata"}).values_at("metadata")
    else
      event= {}
    end

    if event != {} && event[0].values_at("type")[0] == "event"
      cover =  @graph.get_object(feeds.values_at('object_id')[0],{fields: "cover"}).values_at("cover")
      picture = cover[0].values_at("source")[0]
    else
      picture = @graph.get_picture(feeds.values_at('object_id')[0])
    end

    if !feeds.values_at('message')[0]
      message = feeds.values_at('description')[0]
    else
      message = feeds.values_at('message')[0]
    end

    @dhbw_news = DhbwNews.new(
        :feedId         => feeds.values_at('id')[0],
        :message        => message,
        :picture        => picture,
        :link           => feeds.values_at('link')[0],
        :feedDate       => Time.at(feeds.values_at('created_time')[0]).to_datetime
        :stuv           => True
    )

    @dhbw_news.save

  end

end
