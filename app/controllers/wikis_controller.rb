class WikisController < ApplicationController


  def create
     @wiki = Wiki.new
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
     @wiki.user = current_user


     if @wiki.save

       flash[:notice] = "Wiki was saved."
       redirect_to @wiki
     else

       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :new
     end
  end

   def destroy
     @wiki = Wiki.find(params[:id])
 

     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def index
  end

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
  end
  
   def update
     @wiki = Wiki.find(params[:id])
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
     
     authorize @wiki
     #:update?
     
     if @wiki.save
       flash[:notice] = "Wiki was updated."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end
   
   def authorize_user
     @wiki = Wiki.find(params[:id])
    
    if wiki.private
     unless ((current_user == wiki.user && current_user.premium?) || current_user.admin?)
       flash[:alert] = "You must be an admin or the creating user to modify posts from other users."
       redirect_to @wiki
     end
    end
   end
end
