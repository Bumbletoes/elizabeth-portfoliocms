class Image < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :photo, :default_url => "/images/no-image.jpg"
  
  # add this back in to support resizing
  #:styles => { :medium => "300x300", :thumbnail => "100x100" }, 
end
