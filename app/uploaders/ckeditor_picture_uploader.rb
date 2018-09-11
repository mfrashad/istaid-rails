# encoding: utf-8
class CkeditorPictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Ckeditor::Backend::CarrierWave
  include Cloudinary::CarrierWave

  process :assign_tags
  process convert: "jpg"
  version :thumbnail do
    eager
    resize_to_fit(200, 200)
    cloudinary_transformation quality: 80
  end


  # Choose what kind of storage to use for this uploader:
  # storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  def public_id
    "#{model.class.name.demodulize}/#{model.title}_#{timestamp}_"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  process :extract_dimensions

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [118, 100]
  end

  version :content do
    process resize_to_limit: [800, 800]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    Ckeditor.image_file_types
  end

  def assign_tags
    { tags: ["ckeditor", model.class.name.demodulize] }
  end

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) || model.instance_variable_set(var, Time.now.to_i)
  end
end
