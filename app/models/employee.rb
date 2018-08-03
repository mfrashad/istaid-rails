class Employee < ActiveRecord::Base
  mount_uploader :image, EmployeeImageUploader
end
