class AddDefaultToReleasedAttribute < ActiveRecord::Migration
  def change
    change_column :songs, :released, :boolean, default: false
  end
end
