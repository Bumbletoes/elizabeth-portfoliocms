class Gallery < ActiveRecord::Base
  has_many :images

  public 
  def self.all_images_for_gallery(id)
      gallery_images = find(id).images
      response = Array.new
      
      gallery_images.each do |image|
         temp = {title: image[:title], image: image[:photo_file_name]}
         response << temp
      end

      return response
  end

end
