desc "Download des Newsfeeds der DHBW Ravensburg und StuV"

task :fb_newsfeed => :environment do
  require 'koala'


  #Laden des benötigten Authorisierungstokens für den Facebook Zugriff
  @oauth = Koala::Facebook::OAuth.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"])
  oauth_access_token = @oauth.get_app_access_token
  @graph = Koala::Facebook::API.new(oauth_access_token)


  #Laden des Facebook Feeds der DHBW
  feed = @graph.get_connections("DHBWRAVENSBURG", "feed",{date_format: :U})
  DhbwNews.delete_all

  feed.each do |feeds|
    #Abrufen der Metadaten zum Prüfen, ob ein Event vorliegt
    event = @graph.get_object(feeds.values_at('object_id')[0],{metadata: 1, fields: "metadata"}).values_at("metadata")


    #Prüfung, ob Event oder nicht
    if event[0].values_at("type")[0] == "event"
      #Wenn Event vorliegt, abrufen des Cover Bilds
      cover =  @graph.get_object(feeds.values_at('object_id')[0],{fields: "cover"}).values_at("cover")
      picture = cover[0].values_at("source")[0]
    else
      picture = @graph.get_picture(feeds.values_at('object_id')[0])
    end

    #Unterscheidung zwischen normalem Text und Beschreibun eines Bilds oder Events
    if !feeds.values_at('message')[0]
      message = feeds.values_at('description')[0]
    else
      message = feeds.values_at('message')[0]
    end

    #Speichern der geladenen Werte
    @dhbw_news = DhbwNews.new(
        :feedId         => feeds.values_at('id')[0],
        :message        => message,
        :picture        => picture,
        :link           => feeds.values_at('link')[0],
        :feedDate       => Time.at(feeds.values_at('created_time')[0]).to_datetime
    )

    #Persistieren der Werte
    @dhbw_news.save

  end


  #Laden des Facebook Feeds der StuV
  feed = @graph.get_connections("stuvrav", "feed",{date_format: :U})
  feed.each do |feeds|

    #Abrufen der Metadaten zum Prüfen, ob ein Event vorliegt
    event = @graph.get_object(feeds.values_at('object_id')[0],{metadata: 1, fields: "metadata"}).values_at("metadata")


    #Prüfung, ob Event oder nicht
    if event[0].values_at("type")[0] == "event"
      #Wenn Event vorliegt, abrufen des Cover Bilds
      cover =  @graph.get_object(feeds.values_at('object_id')[0],{fields: "cover"}).values_at("cover")
      picture = cover[0].values_at("source")[0]
    else
      picture = @graph.get_picture(feeds.values_at('object_id')[0])
    end

    #Unterscheidung zwischen normalem Text und Beschreibun eines Bilds oder Events
    if !feeds.values_at('message')[0]
      message = feeds.values_at('description')[0]
    else
      message = feeds.values_at('message')[0]
    end

    #Speichern der geladenen Werte
    @dhbw_news = DhbwNews.new(
        :feedId         => feeds.values_at('id').to_s,
        :message        => message,
        :picture        => picture,
        :link           => feeds.values_at('link').to_s,
        :feedDate       => Time.at(feeds.values_at('created_time')[0]).to_datetime,
        :stuv           => True
    )

    #Persistieren der Werte
    @dhbw_news.save

  end

end
