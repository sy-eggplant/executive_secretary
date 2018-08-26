class PeopleDatesController < ApplicationController
  before_action :set_people_date, only: [:show, :update, :destroy]

  # GET /people_dates
  def index
    @people_dates = PeopleDate.all

    render json: @people_dates
  end

  # GET /people_dates/1
  def show
    render json: @people_date
  end

  # POST /people_dates
  def create
    @people_date = PeopleDate.new(people_date_params)

    if @people_date.save
      render json: @people_date, status: :created, location: @people_date
    else
      render json: @people_date.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people_dates/1
  def update
    if @people_date.update(people_date_params)
      render json: @people_date
    else
      render json: @people_date.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people_dates/1
  def destroy
    @people_date.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_date
      @people_date = PeopleDate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def people_date_params
      params.fetch(:people_date, {})
    end
end
