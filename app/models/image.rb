class Image < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}, 
      :default_url => "/assets/no-image.jpg",
      :path => "/var/www/projects/shared/assets/images/:id/:style/:basename.:extension",
      :url => "/assets/uploaded_images/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  # add this back in to support resizing
end
