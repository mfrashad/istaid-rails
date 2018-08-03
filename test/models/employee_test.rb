# == Schema Information
#
# Table name: employees
#
#  id          :integer          not null, primary key
#  name        :string
#  position    :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
