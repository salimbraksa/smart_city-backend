# == Schema Information
#
# Table name: issue_items
#
#  id          :integer          not null, primary key
#  description :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  issue_id    :integer
#

class IssueItem < ApplicationRecord
	belongs_to :issue
	validates :image, presence: true
end
