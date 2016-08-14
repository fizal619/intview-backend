class AddContentToResponses < ActiveRecord::Migration[5.0]
  def change
    add_column :responses, :content, :text
  end
end
