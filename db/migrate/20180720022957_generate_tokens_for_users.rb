class GenerateTokensForUsers < ActiveRecord::Migration[5.1]
  def change
  	User.all.each do |user|
  		user.update_column(:token, SecureRandom.urlsafe_base64)
  	end
  end
end
