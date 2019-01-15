class Video < ActiveRecord::Base
  validates :title, presence: true

  def to_meta_tags
    {
      title: title,
      image_src: thumbnail,
      og: {
        title: title,
        video: 'https://www.youtube.com/v/'+youtube_id,
        image: thumbnail,
      }
    }
  end

  def to_param
    slug
  end
end
