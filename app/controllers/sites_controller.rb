class SitesController < ApplicationController

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find params[:id]
    @events = @site.events
    # and events data for graphs etc
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new site_params
    if @site.save
      redirect_to @site
    else
      flash[:alert] = "Error creating site. Please try again"
      render :new
    end
  end

  private

  def site_params
    params.require(:site).permit(:name)
  end

end