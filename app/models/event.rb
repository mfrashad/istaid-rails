# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  summary    :string
#  thumbnail  :string
#  gallery_id :integer
#

class Event < ActiveRecord::Base
  self.per_page = 10
  mount_uploader :thumbnail, ThumbnailUploader
  belongs_to :gallery

  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true
end
