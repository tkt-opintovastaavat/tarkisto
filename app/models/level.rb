class Level < ActiveRecord::Base
     has_many :courses

     validates_presence_of :name_fi

     def name
          if (I18n.locale == :fi)
               return name_fi
          elsif (I18n.locale == :en)
               return name_en
          elsif (I18n.locale == :se)
               return name_se
          end
     end


end
