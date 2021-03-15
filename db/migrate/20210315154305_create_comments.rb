class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :context
      t.integer :state_id

      t.timestamps
    end
  end
end
