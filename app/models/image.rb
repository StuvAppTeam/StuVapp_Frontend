class Image < ActiveRecord::Base
  #Mounted den carrierwave Uploader
  mount_uploader :photo, PhotoUploader
  #Beziehung zu Offer_Blackboards
  belongs_to :offer_blackboard
end
