json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :title, :description, :totalPrize, :street, :city, :zipcode, :user_id, :size, :rent, :additionalCost, :phase, :deposit, :apartment_type, :movein, :furnished, :internet, :parking, :rooms, :smoking, :request
  json.url apartment_url(apartment, format: :json)
end
