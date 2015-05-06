class Image < ActiveRecord::Base
  #Mounted den carrierwave Uploader
  mount_uploader :photo, PhotoUploader
  #Beziehung zu Offer_Blackboards
  belongs_to :offer_blackboard
  #Beziehung zu Kategorien
  belongs_to :category


  validate :title_without_photo
#Wenn ein Titel eingebeben wird, muss auch eine Url angegeben werden
  def title_without_photo
    if title.present?
      validates_presence_of :photo, :message => "Sie können keinen Titel ohne Bild speichern"
    end
  end

end
