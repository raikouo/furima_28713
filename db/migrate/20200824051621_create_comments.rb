class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user,     null: false,  foreigh_key: true
      t.references :item,     null: false,  foreigh_key: true
      t.text       :comment,  null: false
      t.timestamps
    end
  end
end
