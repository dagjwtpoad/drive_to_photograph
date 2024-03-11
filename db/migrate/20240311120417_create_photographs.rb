class CreatePhotographs < ActiveRecord::Migration[7.0]
  def change
    create_table :photographs do |t|
      t.string     :title
      t.integer    :category_id
      t.integer    :prefecture_id
      t.text       :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
