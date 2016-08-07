class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :name
      t.string :email
      t.text :personality_index
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
