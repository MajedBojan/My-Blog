# == Schema Information
#
# Table name: pages
#
#  id                 :integer          not null, primary key
#  body               :text
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  title              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Page < ApplicationRecord

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
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
