class LevelCareersController < ApplicationController
  before_action :set_level_career, only: %i[show edit update destroy]

  # GET /level_careers
  # GET /level_careers.json
  def index
    @level_careers = LevelCareer.all
  end

  # GET /level_careers/1
  # GET /level_careers/1.json
  def show; end

  # GET /level_careers/new
  def new
    @level_career = LevelCareer.new
  end

  # GET /level_careers/1/edit
  def edit; end

  # POST /level_careers
  # POST /level_careers.json
  def create
    @level_career = LevelCareer.new(level_career_params)

    respond_to do |format|
      if @level_career.save
        format.html { redirect_to @level_career, notice: 'Level career was successfully created.' }
        format.json { render :show, status: :created, location: @level_career }
      else
        format.html { render :new }
        format.json { render json: @level_career.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /level_careers/1
  # PATCH/PUT /level_careers/1.json
  def update
    respond_to do |format|
      if @level_career.update(level_career_params)
        format.html { redirect_to @level_career, notice: 'Level career was successfully updated.' }
        format.json { render :show, status: :ok, location: @level_career }
      else
        format.html { render :edit }
        format.json { render json: @level_career.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /level_careers/1
  # DELETE /level_careers/1.json
  def destroy
    @level_career.destroy
    respond_to do |format|
      format.html { redirect_to level_careers_url, notice: 'Level career was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_level_career
    @level_career = LevelCareer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def level_career_params
    params.require(:level_career).permit(:educative_level_id, :career_id)
  end
end
