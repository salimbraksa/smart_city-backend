# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Issue < ApplicationRecord
	acts_as_votable

	def score
		if recently_created 
			return -self.get_likes.size
		end
		return 100 - self.get_likes.size
	end

	def recently_created
		(Time.now - created_at) < 2 * 3600
	end

end
