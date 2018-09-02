class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :update, :destroy]

  # GET /candidates
  def index
    @candidates = Candidate.all

    render json: @candidates
  end

  # GET /candidates/1
  def show
    render json: @candidate
  end

  # POST /candidates
  def create
    candidate_params = params.require(:candidate).permit(:day, :event_id)
    days = candidate_params[:day].split(",")
    event_id = candidate_params[:event_id]

    days.each{|day|

    @candidate = Candidate.new
    @candidate.day = day
    @candidate.event_id = event_id
    if @candidate.save
      render json: @candidate, status: :created, location: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
    }
  end

  # PATCH/PUT /candidates/1
  def update
    if @candidate.update(candidate_params)
      render json: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /candidates/1
  def destroy
    @candidate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def candidate_params
      params.fetch(:candidate, {})
    end
end
