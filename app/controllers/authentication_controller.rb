class AuthenticationController < ApplicationController

	def sign_in
		@user = User.find_by email: sign_in_params[:email]
		if @user.present? && @user.authenticate(sign_in_params[:password])
        	@token = Knock::AuthToken.new(payload: @user.to_token_payload).token
      	else 
      		error = Error.new("AuthDomainError", 1)
      		render :json => error.to_json, :status => 404
      	end
	end

	private

	def sign_in_params
		params.require(:auth).permit(:email, :password)
	end

end