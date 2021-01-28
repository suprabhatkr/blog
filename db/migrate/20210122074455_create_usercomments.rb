class CreateUsercomments < ActiveRecord::Migration[5.2]
  def change
    create_table :usercomments do |t|
      t.text :body
      t.string :status 
      t.references :article, null: false, foreign_key: true
      t.timestamps
    end
  end
end
