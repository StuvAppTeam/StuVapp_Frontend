class Category < ActiveRecord::Base
  #Beziehung zu Angeboten im schwarzen Brett, ein Datensatz hält mehrere Angebote im schwarzen Brett
  has_many :offer_blackboards

  def name_show
    "#{first}"
  end
  def id_show
    "#{id}"
  end
end
