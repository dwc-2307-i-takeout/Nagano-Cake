class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.integer :price
      t.boolean :is_sale, default:true

    end
  end
end
