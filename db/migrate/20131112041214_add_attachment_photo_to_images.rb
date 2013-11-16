class AddAttachmentPhotoToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :photo
    end
    remove_column :images, :url
  end

  def self.down
  	add_column :images,:url
    drop_attached_file :images, :photo
  end
end
