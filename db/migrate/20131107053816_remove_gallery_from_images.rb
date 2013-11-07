class RemoveGalleryFromImages < ActiveRecord::Migration
  def change
  	change_table :images do |t|
  		t.remove :gallery
  		t.string :gallery_id 
  	end
  	add_index :images, :gallery_id
  end
end
