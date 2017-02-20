class AddBoardIdToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :board_id, :integer
  end
end
