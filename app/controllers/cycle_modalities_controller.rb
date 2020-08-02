# frozen_string_literal: true

# Cycle modalities controller
class CycleModalitiesController < ApplicationController
  before_action :set_cycle_modality, only: %i[show edit update destroy]

  # GET /cycle_modalities
  # GET /cycle_modalities.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @cycle_modalities = CycleModality.paginate(pagination)
  end

  # GET /cycle_modalities/1
  # GET /cycle_modalities/1.json
  def show; end

  # GET /cycle_modalities/new
  def new
    @cycle_modality = CycleModality.new
  end

  # GET /cycle_modalities/1/edit
  def edit; end

  # POST /cycle_modalities
  # POST /cycle_modalities.json
  def create
    @cycle_modality = CycleModality.new(cycle_modality_params)

    respond_to do |format|
      if @cycle_modality.save
        format.html { redirect_to @cycle_modality, notice: 'Cycle modality was successfully created.' }
        format.json { render :show, status: :created, location: @cycle_modality }
      else
        format.html { render :new }
        format.json { render json: @cycle_modality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cycle_modalities/1
  # PATCH/PUT /cycle_modalities/1.json
  def update
    respond_to do |format|
      if @cycle_modality.update(cycle_modality_params)
        format.html { redirect_to @cycle_modality, notice: 'Cycle modality was successfully updated.' }
        format.json { render :show, status: :ok, location: @cycle_modality }
      else
        format.html { render :edit }
        format.json { render json: @cycle_modality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycle_modalities/1
  # DELETE /cycle_modalities/1.json
  def destroy
    @cycle_modality.destroy
    respond_to do |format|
      format.html { redirect_to cycle_modalities_url, notice: 'Cycle modality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cycle_modality
    @cycle_modality = CycleModality.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cycle_modality_params
    params.require(:cycle_modality).permit(:academic_cycle_id, :modality_id)
  end
end
