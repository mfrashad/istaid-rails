class EmployeeImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def public_id
    "#{model.class.name.demodulize}/#{model.name}_#{timestamp}"
  end

  process :assign_tags

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  process resize_to_limit: [1000, 1000]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    cloudinary_transformation width: 250, height: 300, crop: :fill, gravity: :face
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def assign_tags
    { tags: [model.class.name.demodulize] }
  end

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) || model.instance_variable_set(var, Time.now.to_i)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
