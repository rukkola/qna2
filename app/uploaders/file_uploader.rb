class FileUploader < CarrierWave::Uploader::Base

  storage :file # означает что афйлы будут храниться локально

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}" # путь хранения
  end
end
