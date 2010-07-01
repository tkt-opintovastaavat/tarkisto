class CreateShortcuts < ActiveRecord::Migration
     def self.up
          create_table :shortcuts do |t|

               t.string :name
               t.references :course, :options => "CONSTRAINT fk_course REFERENCES courses(id)"
          end
     end

     def self.down
          drop_table :shortcuts
     end
end
