ActiveAdmin.register Apartment do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :description, :totalPrize, :street, :city, :zipcode, :user_id, :size, :rent, :additionalCost, :phase, :deposit, :apartment_type, :movein, :furnished, :internet, :parking, :rooms, :smoking, :request
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
