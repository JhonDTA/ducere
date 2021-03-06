# frozen_string_literal: true

# Buildings controller
class BuildingsController < ApplicationController
  before_action :set_building, only: %i[show edit update destroy]

  # GET /buildings
  # GET /buildings.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @buildings = Building.paginate(pagination)
                         .includes(%i[campus status])
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show; end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit; end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_building
    @building = Building.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def building_params
    params.require(:building).permit(:code, :description, :campus_id, :status_id)
  end
end
