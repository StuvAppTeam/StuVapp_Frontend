class Campu < ActiveRecord::Base
  #Beziehung zu Image und erlaubt das löschen
  has_one :image, :dependent => :destroy
  #Erlaubt Zugriff auf Attribute von Image und diese auch zu löschen
  accepts_nested_attributes_for :image, :allow_destroy => true
end
