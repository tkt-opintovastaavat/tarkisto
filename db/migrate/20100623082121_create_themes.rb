class CreateThemes < ActiveRecord::Migration
     def self.up
          create_table :themes do |t|
               t.string :name_fi
               t.string :name_en
               t.string :name_se
          end
     end

     def self.down
          drop_table :themes
     end
end
