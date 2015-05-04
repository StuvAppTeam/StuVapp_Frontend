json.array!(@campus) do |campu|
  json.extract! campu, :id, :street, :zipcode, :city, :name, :description, :longitude, :latitude
  json.url campu_url(campu, format: :json)
end
