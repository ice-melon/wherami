class App < ActiveRecord::Base
	belongs_to :user

	validates :app_name, presence: true, 
						 length: {maximum: 50},
						 uniqueness: { case_sensitive: false }
	validates :package_name, presence: true,length: {maximum: 50},
							uniqueness: {case_sensitive:false}
	validates :app_description, presence: true, 
								length: {maximum: 200}
	validates :website, length: {maximum: 50}
	validates :team_name, length: {maximum: 50}
	validates :user_id, presence: true
	validates :fingerprint, presence: true
	





end
