class Error

	attr_reader :domain
	attr_reader :code

	def initialize domain, code
		@domain = domain
		@code = code
	end

	def to_json options = {}
		{
			error: {
				domain: @domain,
				code: @code
			}
		}
	end

end