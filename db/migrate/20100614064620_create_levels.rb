class CreateLevels < ActiveRecord::Migration

  def self.up
    create_table :levels do |t|
      t.string :name_fi
      t.string :name_se
      t.string :name_en
    end
  end

  def self.down
    drop_table :levels
  end

end
