class AddShowingOrderToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :showing_order, :integer
  end

  def self.down
    remove_column :questions, :showing_order
  end
end
