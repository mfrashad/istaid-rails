# == Schema Information
#
# Table name: gallery_images
#
#  id         :integer          not null, primary key
#  image      :string
#  caption    :string
#  gallery_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  mount_uploader :image, GalleryImageUploader
end
