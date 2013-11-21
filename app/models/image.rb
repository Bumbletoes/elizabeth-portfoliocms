class Image < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :photo, :default_url => "/images/:style/missing.png"
end
