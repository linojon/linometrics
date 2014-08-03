class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :page_url
      t.string :property_1
      t.string :property_2
      t.references :site
      t.date :created_on

      t.timestamps
    end
  end
end
