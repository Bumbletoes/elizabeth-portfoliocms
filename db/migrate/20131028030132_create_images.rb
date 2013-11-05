class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :url
      t.string :description
      t.string :gallery
      t.date :date_taken

      t.timestamps
    end
  end
end
