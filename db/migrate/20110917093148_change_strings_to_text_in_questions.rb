class ChangeStringsToTextInQuestions < ActiveRecord::Migration
  def self.up
    change_column :questions, :name, :text
    change_column :questions, :description, :text
  end

  def self.down
  end
end
