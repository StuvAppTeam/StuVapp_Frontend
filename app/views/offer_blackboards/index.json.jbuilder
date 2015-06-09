json.array!(@offer_blackboards) do |offer_blackboard|
  json.extract! offer_blackboard, :id, :title, :description, :totalPrice, :image_id, :street,:user, :city, :zipcode , :category_id, :condition, :request
  json.url offer_blackboard_url(offer_blackboard, format: :json)
  json.user offer_blackboard.user.email
end
