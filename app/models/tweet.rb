class Tweet < ActiveRecord::Base

	validate :hashtags_created
=begin
	include Twitter::Extractor

	def extract_hashtags
		extract_hashtags(self.tweet)
	end

	def save_hashtags
		Hashtag.create(hashtag: @tweet.tweet)
	end

	def hashtags_created
		begin
			transaction do
				@hashtags = self.extract_hashtags
				@hashtags.each do |the_hashtag|
					if Hashtag.where(hashtag: the_hashtag).any?
						#do nothing
					else
						if Hashtag.create(hashtag: the_hashtag)
							#do nothing
						else
							self.errors.add(:tweet, "The hashtag is invalid.")
						end
					end
				end
			end
		rescue
			self.errors.add(:tweet, "The hashtag is invalid.") unless self.errors.any?
		end
	end
=end

	belongs_to :user

	validates :tweet, length: { maximum: 140 }

	has_and_belongs_to_many :hashtags

end
