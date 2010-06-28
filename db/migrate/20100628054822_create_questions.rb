class CreateQuestions < ActiveRecord::Migration
     def self.up
         create_table :questions do |t|
              t.integer :number
              t.string :description
              t.string :name
              t.integer :points
              t.references :exam, :options => "CONSTRAINT fk_exam REFERENCES exams(id)"
              t.timestamps
         end
      

     end
end

     def self.down
         drop_table :questions
     end
end
