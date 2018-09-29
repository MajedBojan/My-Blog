# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  post_id         :integer
#
# Indexes
#
#  index_users_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#

class User < ApplicationRecord
  has_secure_password

	validates :email, confirmation: true
	# validates :email_confirmation, presence: true
	validates :email, confirmation: { case_sensitive: false }

#  validates_confirmation_of :password
  # has_attached_file :image, styles: { medium: "220x180>", thumb: "150x120>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


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
