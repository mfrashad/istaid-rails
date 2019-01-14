class Video < ActiveRecord::Base
  validates :title, presence: true

  def to_param
    slug
  end
end
