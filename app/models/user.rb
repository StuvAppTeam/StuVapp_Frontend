class User < ActiveRecord::Base
  #Beziehung zu Offer_Blackboards, ein User kann mehrere Angebote haben
  has_many :offer_blackboards

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    #user.name = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end
end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
  if user
    return user
  else
    registered_user = User.where(:email => auth.info.email).first

    return registered_user if registered_user

    user = User.new(
                   provider:auth.provider,
                   uid:auth.uid,
                   email:auth.info.email,
                   password:Devise.friendly_token[0,20]
           )
    user.skip_confirmation!
    user.save
    user
  end
end

end
