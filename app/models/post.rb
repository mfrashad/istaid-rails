# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  slug        :string
#  body        :text
#  image_url   :string
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  thumbnail   :string
#  summary     :string
#

class Post < ActiveRecord::Base
  self.per_page = 10
  belongs_to :user
  belongs_to :category
  has_many :comments, as: :commentable
  mount_uploader :thumbnail, ThumbnailUploader

  default_scope -> { includes(:user).order(published_at: :desc) }
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
  validates :category, presence: true
  validates :user, presence: true

  def to_param
    slug
  end
end
