json.array!(@dhbw_news) do |dhbw_news|
  json.extract! dhbw_news, :id, :feedId, :message, :picture, :link, :feedDate, :stuv
  json.url dhbw_news_url(dhbw_news, format: :json)
end
