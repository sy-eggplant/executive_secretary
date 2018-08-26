class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # GET /events/url
  def show_url
    url = params[:url]
    @event = Event.find_by(url: url)
    render json: @event
  end

  # POST /events
  def create
    e_params = params.require(:event).permit(:title)
    @event = Event.new(e_params)  
    if @event.save
      origin = @event.id.to_s + @event.created_at.to_s
      url = Digest::MD5.new.update(origin).to_s
      @event.update_attribute(:url, url)
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.fetch(:event, {})
    end
end
