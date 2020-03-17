class AddUidToBirdwatchers < ActiveRecord::Migration[6.0]
  def change
    add_column :birdwatchers, :uid, :integer
  end
end
