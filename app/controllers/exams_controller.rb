class ExamsController < ApplicationController

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
