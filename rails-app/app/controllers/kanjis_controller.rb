class KanjisController < ApplicationController
  before_action :set_kanji, only: [:show, :update, :destroy]

  # GET /kanjis
  def index
    @kanjis = Kanji.all

    render json: @kanjis
  end

  # GET /kanjis/1
  def show
    render json: @kanji
  end

  # POST /kanjis
  def create
    kanji_params = params.require(:kanji).permit(:name, :pass)
    @kanji = Kanji.new(kanji_params)

    if @kanji.save
      render json: @kanji, status: :created, location: @kanji
    else
      render json: @kanji.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kanjis/1
  def update
    if @kanji.update(kanji_params)
      render json: @kanji
    else
      render json: @kanji.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kanjis/1
  def destroy
    @kanji.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kanji
      @kanji = Kanji.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def kanji_params
      params.fetch(:kanji, {})
    end
end
