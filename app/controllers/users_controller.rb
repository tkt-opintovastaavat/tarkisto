class UsersController < ApplicationController
     before_filter :jquery_noconflict
 
     def jquery_noconflict
           ActionView::Helpers::PrototypeHelper.const_set(:JQUERY_VAR, 'jQuery')
     end
=begin         
     # GET /users
     # GET /users.xml
     def index
          @users = User.all

           respond_to do |format|
               format.html #index.html.erb
               format.xml  { render :xml => @users }
           end
     end

     # GET /users/1
     # GET /users/1.xml
     def show
          @user = User.find(params[:id])

          respond_to do |format|
               format.html # show.html.erb
               format.xml  { render :xml => @user }
          end
     end

     # GET /users/new
     # GET /users/new.xml
     def new
          @user = User.new

          respond_to do |format|
               format.html # new.html.erb
               format.xml  { render :xml => @user }
          end
     end

     # GET /users/1/edit
     def edit
          @user = User.find(params[:id])
     end

     # POST /users
     # POST /users.xml
     def create
          @user = User.new(params[:user])

          respond_to do |format|
               if @user.save
                    format.html { redirect_to(@user, :notice => 'User was successfully created.') }
                    format.xml  { render :xml => @user, :status => :created, :location => @user }
               else
                    format.html { render :action => "new" }
                    format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
               end
          end
     end

     # PUT /users/1
     # PUT /users/1.xml
     def update
          @user = User.find(params[:id])

          respond_to do |format|
               if @user.update_attributes(params[:user])
                    format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
                    format.xml  { head :ok }
               else
                    format.html { render :action => "edit" }
                    format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
               end
          end
     end

     # DELETE /users/1
     # DELETE /users/1.xml
     def destroy
          @user = User.find(params[:id])
          @user.destroy

          respond_to do |format|
               format.html { redirect_to(users_url) }
               format.xml  { head :ok }
          end
     end
=end
     active_scaffold :user do |config|
          config.label = "User"
          config.columns = [ :username, :email, :language, :access ]
          list.sorting = {:username => 'ASC'}
          columns[:username].label = "Username: #"
          columns[:email].label = "Email: #"
          columns[:language].label = "Language: #"
          columns[:access].label = "Access: #"
     end
                                                         
end
