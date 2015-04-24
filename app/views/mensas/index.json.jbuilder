json.array!(@mensas) do |mensa|
  json.extract! mensa, :id, :timestamp, :category, :title, :price
  json.url mensa_url(mensa, format: :json)
end
