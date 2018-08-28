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

require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
