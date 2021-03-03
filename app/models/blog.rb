class Blog < ApplicationRecord
	include Visible
	belongs_to :user
	has_rich_text :content
	validates :title, presence: true
	validate :has_content
	validates :user_id, presence: true

	def has_content
		unless content&.body&.present?
			errors.add(:content, "Cant be blank.")
		end
	end
end
