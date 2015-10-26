class AddSlugToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :slug, :string
    add_index :journals, :slug, unique: true
  end
end
