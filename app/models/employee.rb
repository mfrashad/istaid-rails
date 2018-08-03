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

class Employee < ActiveRecord::Base
  mount_uploader :image, EmployeeImageUploader
end
