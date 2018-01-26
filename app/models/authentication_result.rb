class AuthenticatioResult 

    attr_reader :token
    attr_reader :user

    def initialize(user, token)
    	@user = user
    	@token = token
    end

    

end