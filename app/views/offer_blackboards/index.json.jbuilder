json.array!(@offer_blackboards) do |offer_blackboard|
  json.extract! offer_blackboard, :id, :images, :title, :description, :totalPrice,  :street,:user, :city, :zipcode , :category_id, :condition, :request, :phone
  json.url offer_blackboard_url(offer_blackboard, format: :json)
  json.user offer_blackboard.user.email
  json.images offer_blackboard.images, :photo, :title
end
