class AddPhotoToMoments < ActiveRecord::Migration
  def change
    add_column :moments, :photo, :string
  end
end
