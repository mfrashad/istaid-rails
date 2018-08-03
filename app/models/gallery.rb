# == Schema Information
#
# Table name: galleries
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gallery < ActiveRecord::Base
  has_many :gallery_images, dependent: :destroy
  accepts_nested_attributes_for :gallery_images, allow_destroy: true, reject_if: :all_blank # Ignore the blank template record
end
