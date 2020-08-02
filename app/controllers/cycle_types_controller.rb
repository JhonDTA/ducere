# frozen_string_literal: true

# Cycle types controller
class CycleTypesController < ApplicationController
  before_action :set_cycle_type, only: %i[show edit update destroy]

  # GET /cycle_types
  # GET /cycle_types.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @cycle_types = CycleType.paginate(pagination)
  end

  # GET /cycle_types/1
  # GET /cycle_types/1.json
  def show; end

  # GET /cycle_types/new
  def new
    @cycle_type = CycleType.new
  end

  # GET /cycle_types/1/edit
  def edit; end

  # POST /cycle_types
  # POST /cycle_types.json
  def create
    @cycle_type = CycleType.new(cycle_type_params)

    respond_to do |format|
      if @cycle_type.save
        format.html { redirect_to @cycle_type, notice: 'Cycle type was successfully created.' }
        format.json { render :show, status: :created, location: @cycle_type }
      else
        format.html { render :new }
        format.json { render json: @cycle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cycle_types/1
  # PATCH/PUT /cycle_types/1.json
  def update
    respond_to do |format|
      if @cycle_type.update(cycle_type_params)
        format.html { redirect_to @cycle_type, notice: 'Cycle type was successfully updated.' }
        format.json { render :show, status: :ok, location: @cycle_type }
      else
        format.html { render :edit }
        format.json { render json: @cycle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycle_types/1
  # DELETE /cycle_types/1.json
  def destroy
    @cycle_type.destroy
    respond_to do |format|
      format.html { redirect_to cycle_types_url, notice: 'Cycle type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cycle_type
    @cycle_type = CycleType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cycle_type_params
    params.require(:cycle_type).permit(:code, :name, :description, :duration, :status_id)
  end
end
