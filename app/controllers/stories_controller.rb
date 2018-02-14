class StoriesController < ApplicationController
  before_action :ensure_login, only: [ :new, :create ]
  def index
    @current_time= Time.now
    @story= Story.order('RANDOM()').first
    @story_count= Story.count
  end
  
  def create
     @story = @current_user.stories.build story_params
    if @story.save
      flash[:notice]= 'Story submission succeeded'
      redirect_to stories_path
    else
      render action:'new'
    end
  end
  
  def new
    @story= Story.new
  end
  
  def show
    @story= Story.find(params[:id])
  end
  
  def edit
   @story = Story.find params[:id]
 end

 def update
   @story = Story.find params[:id]
   if @story.update_attributes(story_params)
     render'show'
   else
     render 'edit'
   end
 end
  
  private
  
  def story_params
    params.require(:story).permit(:name, :link)
  end
  
end
