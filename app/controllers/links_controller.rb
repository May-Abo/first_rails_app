class LinksController < ApplicationController
  
  before_action :set_link, only: [:edit, :update, :show, :destroy]
  
  def index
    @links = Link.all
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Link was successfully created"
      redirect_to link_path(@link)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def show
  end
  
  def view
    @link = Link.find_by(slug: params[:slug]) 
    if @link.nil?
      redirect_to root_path
    else
      @link.update_attribute(:clicked, @link.clicked + 1)
      redirect_to @link.url
    end
  end
  
  def update
    if @link.update(link_params)
    flash[:notice] = "Link was successfully updated"
    redirect_to link_path(@link)
    else
    render 'edit'
    end
  end
  
  def destroy
    @link.destroy
    flash[:notice] = "Link was successfully deleted"
    redirect_to links_path
  end
  
  private
    def link_params
      params.require(:link).permit(:url, :slug, :clicked)
    end
    
    def set_link
      @link = Link.find(params[:id])
    end
  
end