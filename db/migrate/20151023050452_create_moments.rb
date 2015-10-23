class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string :title
      t.text :description
      t.boolean :public

      t.timestamps null: false
    end
  end
end
