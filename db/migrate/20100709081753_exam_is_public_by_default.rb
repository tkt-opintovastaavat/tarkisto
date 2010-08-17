class ExamIsPublicByDefault < ActiveRecord::Migration

     def self.up
          change_column_default :exams, :public, true
     end

     def self.down
          change_column_default :exams, :public, false
     end

end
