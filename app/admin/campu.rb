ActiveAdmin.register Campu do
  form(:html => { :multipart => true }) do |f|
    f.inputs "Campus" do
      f.input :street
      f.input :zipcode
      f.input :city
      f.input :name
      f.input :description
      f.input :longitude
      f.input :latitude
    end
    f.inputs "Bilder", for: [:image, f.object.image || Image.new] do |image|
      image.input :photo
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :street, :zipcode, :city, :name, :description, :longitude, :latitude,image_attributes: [:id, :title, :photo, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
