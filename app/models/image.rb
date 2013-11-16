class Image < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :photo, :styles => { thumb: "260x180" }, default_url: "/images/:style/missing.png"
  validates :photo, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :photo

 

end
