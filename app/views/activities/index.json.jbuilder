json.array!(@activities) do |activity|
  json.extract! image, :id, :title, :description, :telephone, :email, :contactName, :type, :weekday, :street, :zipcode, :city, :locationName, :locationDescription, :longitude, :latitude
  json.url image_url(image, format: :json)
end
