class AddDefaultToUsersPublicColumn < ActiveRecord::Migration
  def change
  	change_column :moments, :public, :boolean, default: false
  end
end
