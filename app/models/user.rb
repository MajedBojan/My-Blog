# == Schema Information
#
# Table name: admin_users
#
#  id                 :integer          not null, primary key
#  email              :string
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  password_digest    :string
#  privilege          :boolean
#  username           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

	validates :email, confirmation: true
	# validates :email_confirmation, presence: true
	validates :email, confirmation: { case_sensitive: false }

#  validates_confirmation_of :password
  has_attached_file :image, styles: { medium: "220x180>", thumb: "150x120>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  ## -------------------- Requirements -------------------- ##
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  ## -------------------- Associations -------------------- ##
  ## -------------------- Validations --------------------- ##
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end
