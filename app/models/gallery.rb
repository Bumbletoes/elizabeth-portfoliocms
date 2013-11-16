class Gallery < ActiveRecord::Base
  has_many :images
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
