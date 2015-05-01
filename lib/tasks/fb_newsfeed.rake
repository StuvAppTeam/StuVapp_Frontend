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

    @dhbw_news = DhbwNews.new(
        :feedId         => feeds.values_at('id')[0],
        :message        => feeds.values_at('message')[0],
        :picture        => feeds.values_at('picture')[0],
        :link           => feeds.values_at('link')[0],
        :feedDate       => Time.at(feeds.values_at('created_time')[0]).to_datetime
    )

    @dhbw_news.save

  end


  #Laden des Facebook Feeds der StuV
  feed = @graph.get_connections("stuvrav", "feed",{date_format: :U})
  feed.each do |feeds|

    @dhbw_news = DhbwNews.new(
        :feedId         => feeds.values_at('id').to_s,
        :message        => feeds.values_at('message').to_s,
        :picture        => feeds.values_at('picture').to_s,
        :link           => feeds.values_at('link').to_s,
        :feedDate       => Time.at(feeds.values_at('created_time')[0]).to_datetime,
        :stuv           => True
    )

    @dhbw_news.save

  end
end
