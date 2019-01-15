class Video < ActiveRecord::Base
  validates :title, presence: true

  def to_meta_tags
    {
      title: title,
      image_src: thumbnail,
      og: {
        title: title,
        type: 'video',
        image: thumbnail,
        url: youtube_url,
      }
    }
  end

  def to_param
    slug
  end
end
