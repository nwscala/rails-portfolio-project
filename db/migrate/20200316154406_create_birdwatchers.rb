class CreateBirdwatchers < ActiveRecord::Migration[6.0]
  def change
    create_table :birdwatchers do |t|
      t.string :name
      t.string :password_digest
      t.integer :age
      t.boolean :ornithologist, default: false

      t.timestamps
    end
  end
end
