class AdminUser < ApplicationRecord
  has_secure_password

	validates :email, confirmation: true
	# validates :email_confirmation, presence: true
	validates :email, confirmation: { case_sensitive: false }

#  validates_confirmation_of :password
  has_attached_file :image, styles: { medium: "220x180>", thumb: "150x120>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
