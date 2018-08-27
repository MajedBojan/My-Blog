class Profileimage < ApplicationRecord

  has_attached_file :image, styles: { medium: "300x300>", thumb: "80x80>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
