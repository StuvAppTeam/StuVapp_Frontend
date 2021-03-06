json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :images, :title,:description, :totalPrize, :street, :city, :zipcode, :user_id, :size, :rent, :additionalCost, :phase, :deposit, :apartment_type, :movein, :furnished, :internet, :parking, :rooms, :smoking, :request, :phone
  json.url apartment_url(apartment, format: :json)
  json.user apartment.user.email
  json.images apartment.images, :photo, :title
end
