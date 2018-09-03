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
#  sort        :integer
#

class Employee < ActiveRecord::Base
  include RailsSortable::Model
  set_sortable :sort
  mount_uploader :image, EmployeeImageUploader
end
