class CreateTypes < ActiveRecord::Migration

  def self.up
    create_table :types do |t|
      t.string :name_fi
      t.string :name_en
      t.string :name_se
    end
  end

  def self.down
    drop_table :types
  end

end
