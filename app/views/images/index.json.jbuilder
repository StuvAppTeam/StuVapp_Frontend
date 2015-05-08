json.array!(@images) do |image|
  json.extract! image, :id, :title, :photo, :category_id, :offer_blackboard_id, :campus_id,:offer_apartment_id
  json.url image_url(image, format: :json)
end
