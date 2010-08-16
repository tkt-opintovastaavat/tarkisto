class CodesController < ApplicationController
     def create text
          @code = CodeSnippets.create :text => text
     end
end
