ActiveAdmin.register Category do
  form(:html => { :multipart => true }) do |f|
    f.inputs "Kategorie" do
      f.input :name
    end
    f.inputs "Bilder", for: [:image, f.object.image || Image.new] do |image|
      image.input :photo
    end



    f.actions


  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, image_attributes: [:id, :title, :photo, :offer_blackboard_id, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
