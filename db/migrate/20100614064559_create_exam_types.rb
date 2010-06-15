class CreateExamTypes < ActiveRecord::Migration
     def self.up
          create_table :exam_types do |t|
               t.string :name
          end
     end

     def self.down
          drop_table :exam_types
     end
end
