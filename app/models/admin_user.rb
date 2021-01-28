class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.new_with_session(params, session)
	  super.tap do |admin_user|
	    if data = session["devise.google_oauth2_data"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
	      admin_user.email = data["email"] if admin_user.email.blank?
	    end
	  end
	end

	def self.from_omniauth(auth)
	  logger.info auth 
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |admin_user|
	    admin_user.email = auth.info.email
	    admin_user.password = Devise.friendly_token[0,20]
	    admin_user.name = auth.info.name   # assuming the user model has a name
	    #user.image = auth.info.image # assuming the user model has an image
	  end
	end
	def password_required?
		super && provider.blank?
	end
	def email_required?
		super && provider.blank?
	end
end
