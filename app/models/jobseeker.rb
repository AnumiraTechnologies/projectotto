class Jobseeker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :omniauthable, :rememberable, :trackable, :validatable

  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    jobseeker = Jobseeker.where(:provider => auth.provider, :uid => auth.uid).first
    if jobseeker
      return jobseeker
    else
      registered_jobseeker = Jobseeker.where(:email => auth.info.email).first
      if registered_jobseeker
        return registered_jobseeker
      else

        jobseeker = Jobseeker.create(name:auth.info.first_name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end
    end
  end   
end

