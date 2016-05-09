class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		auth = request.env["omniauth.auth"]
		data = {
			name: auth.info.name,
			username: auth.info.name,
			image: auth.info.image,
			provider: auth.provider,
			uid: auth.uid
		}

		@user = User.find_or_create_by_omniauth(data)

		if @user.persisted?
			sign_in_and_redirect @user, event: :authentication
		else
			session[:omniauth_errors] = @user.errors.full_messages.to_sentence unless @usuario.save
			session[:omniauth_data] = data
			redirect_to new_user_registration_url
		end
	end

	def twitter
		auth = request.env["omniauth.auth"]
		data = {
			name: auth.info.name,
			username: auth.info.nickname,
			image: auth.info.image,
			provider: auth.provider,
			uid: auth.uid
		}

		@user = User.find_or_create_by_omniauth(data)

		if @user.persisted?
			sign_in_and_redirect @user, event: :authentication
		else
			session[:omniauth_errors] = @user.errors.full_messages.to_sentence unless @usuario.save
			session[:omniauth_data] = data
			redirect_to new_user_registration_url
		end

	end
end
