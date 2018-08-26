class EventPeopleController < ApplicationController
  before_action :set_event_person, only: [:show, :update, :destroy]

  # GET /event_people
  def index
    @event_people = EventPerson.all

    render json: @event_people
  end

  # GET /event_people/1
  def show
    render json: @event_person
  end

  # POST /event_people
  def create
    @event_person = EventPerson.new(event_person_params)

    if @event_person.save
      render json: @event_person, status: :created, location: @event_person
    else
      render json: @event_person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_people/1
  def update
    if @event_person.update(event_person_params)
      render json: @event_person
    else
      render json: @event_person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_people/1
  def destroy
    @event_person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_person
      @event_person = EventPerson.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_person_params
      params.fetch(:event_person, {})
    end
end
