class Image < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :photo, :default_url => "/images/no-image.jpg"
end
