class AddDogsToUser < ActiveRecord::Migration[5.2]
  def self.up
    add_column :dogs, :user_id, :integer
    add_index 'dogs', ['user_id'], :name => 'index_user_id'
  end

  def self.down
    remove_column :dogs, :user_id
  end
end
