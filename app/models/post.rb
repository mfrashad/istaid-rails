class Post < ActiveRecord::Base
  self.per_page = 10
  belongs_to :user
  belongs_to :category
  has_many :comments, as: :commentable
  mount_uploader :thumbnail, ThumbnailUploader

  default_scope -> { includes(:user).order(created_at: :desc) }
  scope :by_category, -> (category_name) do
    joins(:category).where(categories: { name: category_name })
  end
  scope :search, -> (search) do
    where('title ILIKE lower(?) OR body ILIKE lower(?)', "%#{search}%", "%#{search}%" )
  end

  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true
  validates :category, presence: true
  validates :user, presence: true
end
