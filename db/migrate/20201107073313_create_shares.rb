class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :title
      t.string :content
      t.string :place
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
