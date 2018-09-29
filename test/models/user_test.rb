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

require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
