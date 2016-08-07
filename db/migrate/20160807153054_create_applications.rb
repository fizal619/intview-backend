class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :title
      t.text :questions
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
