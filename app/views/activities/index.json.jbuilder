json.array!(@activities) do |activity|
  json.extract! image, :id, :title, :description, :telephone, :email, :contactName, :activity_type, :weekday, :street, :zipcode, :city, :locationName, :locationDescription, :longitude, :latitude
  json.url image_url(image, format: :json)
end
