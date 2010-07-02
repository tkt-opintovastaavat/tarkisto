class CreateAttendances < ActiveRecord::Migration
     def self.up
          create_table :attendances do |t|
               t.references :instance, :options => "CONSTRAINT fk_instance REFERENCES instances(id)"
               t.references :user, :options => "CONSTRAINT fk_user REFERENCES users(id)"
               t.timestamps
          end
     end

     def self.down
          drop_table :attendances
     end
end
