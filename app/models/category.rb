class Category < ActiveRecord::Base
  #Beziehung zu Angeboten im schwarzen Brett, ein Datensatz hält mehrere Angebote im schwarzen Brett
  has_many :offer_blackboards

  #Beziehung zu Image und erlaubt das löschen
  has_one :image, :dependent => :destroy
  #Erlaubt Zugriff auf Attribute von Image und diese auch zu löschen
  accepts_nested_attributes_for :image, :allow_destroy => true


  def name_show
    "#{first}"
  end
  def id_show
    "#{id}"
  end
end
