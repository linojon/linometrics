class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cors_headers
  respond_to :json

  # OPTION
  def index
    render :text => '', :content_type => 'text/plain'
  end

  # POST xhr.json
  def create
    site = Site.find_by_name params[:site]
    if site.nil?
      render json: { error: 'unregistered site name' }, status: 422
      
    else
      event = site.events.build event_params
      event.page_url = request.referrer

      if event.save
        render json: { message: 'created' }, status: 201 
      else
        render json: { error: 'unprocessable params' }, status: 422 
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :property_1, :property_2)
  end

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Max-Age'] = '1728000'
  end

end
