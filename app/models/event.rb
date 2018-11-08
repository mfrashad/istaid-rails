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
  belongs_to :category
  belongs_to :gallery
  has_many :comments, as: :commentable
  mount_uploader :thumbnail, ThumbnailUploader

  scope :by_category, -> (category_name) do
    joins(:category).where(categories: { name: category_name })
  end
  scope :search, -> (search) do
    where('title ILIKE lower(?) OR body ILIKE lower(?)', "%#{search}%", "%#{search}%" )
  end

  def to_meta_tags
    {
      title: title,
      image_src: thumbnail.thumb.url,
      og: {
        title: title,
        type: 'article',
        image: thumbnail.thumb.url
      }
    }
  end

  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true
end
