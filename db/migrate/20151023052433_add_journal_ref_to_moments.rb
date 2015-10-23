class AddJournalRefToMoments < ActiveRecord::Migration
  def change
    add_reference :moments, :journal, index: true, foreign_key: true
  end
end
