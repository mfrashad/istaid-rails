class Gallery < ActiveRecord::Base
  mount_uploaders :images, GalleryImageUploader
end
