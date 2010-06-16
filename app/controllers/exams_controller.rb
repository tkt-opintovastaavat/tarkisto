class ExamsController < ApplicationController

     # set_tab is tabs_on_rails method that sets the current tab as the one specified
     def index
     	set_tab :all
     end

     def show
     end

     def new
     	set_tab :new
     end

     def generate
     	set_tab :generate
     end

end
