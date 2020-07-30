class AcademicCyclesController < ApplicationController
  before_action :set_academic_cycle, only: %i[show edit update destroy]

  # GET /academic_cycles
  # GET /academic_cycles.json
  def index
    @academic_cycles = AcademicCycle.paginate(page: params[:page], per_page: 20)
  end

  # GET /academic_cycles/1
  # GET /academic_cycles/1.json
  def show; end

  # GET /academic_cycles/new
  def new
    @academic_cycle = AcademicCycle.new
  end

  # GET /academic_cycles/1/edit
  def edit; end

  # POST /academic_cycles
  # POST /academic_cycles.json
  def create
    @academic_cycle = AcademicCycle.new(academic_cycle_params)

    respond_to do |format|
      if @academic_cycle.save
        format.html { redirect_to @academic_cycle, notice: 'Academic cycle was successfully created.' }
        format.json { render :show, status: :created, location: @academic_cycle }
      else
        format.html { render :new }
        format.json { render json: @academic_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_cycles/1
  # PATCH/PUT /academic_cycles/1.json
  def update
    respond_to do |format|
      if @academic_cycle.update(academic_cycle_params)
        format.html { redirect_to @academic_cycle, notice: 'Academic cycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_cycle }
      else
        format.html { render :edit }
        format.json { render json: @academic_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_cycles/1
  # DELETE /academic_cycles/1.json
  def destroy
    @academic_cycle.destroy
    respond_to do |format|
      format.html { redirect_to academic_cycles_url, notice: 'Academic cycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_academic_cycle
    @academic_cycle = AcademicCycle.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def academic_cycle_params
    params.require(:academic_cycle).permit(:code, :name, :description, :cycle_type_id, :status_id, :start, :finish)
  end
end
