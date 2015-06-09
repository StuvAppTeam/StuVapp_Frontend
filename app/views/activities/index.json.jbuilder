json.array!(@activities) do |activity|
  json.extract! activity, :id, :title, :description, :telephone, :email, :contactName, :activity_type, :weekday, :street, :zipcode, :city, :locationName, :locationDescription, :longitude, :latitude
  json.url activity_url(activity, format: :json)
end
