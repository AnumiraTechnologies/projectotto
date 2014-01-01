class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def linkedin
		auth = env["omniauth.auth"]
		@jobseeker = Jobseeker.connect_to_linkedin(request.env["omniauth.auth"], current_jobseeker)
		if @jobseeker.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
				sign_in_and_redirect @jobseeker, :event => :authentication
		else
			session["devise.linkedin_uid"] = request.env["omniauth.auth"]
			redirect_to_new_user_registration_url
		end
	end
end