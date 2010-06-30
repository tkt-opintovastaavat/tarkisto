class CreateImages < ActiveRecord::Migration
     def self.up
          create_table :images do |t|
               t.string :image_path
               t.references :question, :options => "CONSTRAINT fk_question REFERENCES questions(id)"
               t.timestamps
          end
     end

     def self.down
          drop_table :images
     end
end
