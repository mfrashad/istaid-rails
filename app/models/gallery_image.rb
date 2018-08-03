# == Schema Information
#
# Table name: gallery_images
#
#  id         :integer          not null, primary key
#  image      :string
#  gallery_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GalleryImage < ActiveRecord::Base
end
