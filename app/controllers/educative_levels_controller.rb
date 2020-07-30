class EducativeLevelsController < ApplicationController
  before_action :set_educative_level, only: %i[show edit update destroy]

  # GET /educative_levels
  # GET /educative_levels.json
  def index
    @educative_levels = EducativeLevel.paginate(page: params[:page], per_page: 20)
  end

  # GET /educative_levels/1
  # GET /educative_levels/1.json
  def show; end

  # GET /educative_levels/new
  def new
    @educative_level = EducativeLevel.new
  end

  # GET /educative_levels/1/edit
  def edit; end

  # POST /educative_levels
  # POST /educative_levels.json
  def create
    @educative_level = EducativeLevel.new(educative_level_params)

    respond_to do |format|
      if @educative_level.save
        format.html { redirect_to @educative_level, notice: 'Educative level was successfully created.' }
        format.json { render :show, status: :created, location: @educative_level }
      else
        format.html { render :new }
        format.json { render json: @educative_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /educative_levels/1
  # PATCH/PUT /educative_levels/1.json
  def update
    respond_to do |format|
      if @educative_level.update(educative_level_params)
        format.html { redirect_to @educative_level, notice: 'Educative level was successfully updated.' }
        format.json { render :show, status: :ok, location: @educative_level }
      else
        format.html { render :edit }
        format.json { render json: @educative_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educative_levels/1
  # DELETE /educative_levels/1.json
  def destroy
    @educative_level.destroy
    respond_to do |format|
      format.html { redirect_to educative_levels_url, notice: 'Educative level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_educative_level
    @educative_level = EducativeLevel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def educative_level_params
    params.require(:educative_level).permit(:code, :name, :description, :status_id)
  end
end
