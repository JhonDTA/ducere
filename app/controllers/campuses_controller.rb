# frozen_string_literal: true

# Campuses controller
class CampusesController < ApplicationController
  before_action :set_campus, only: %i[show edit update destroy]

  # GET /campuses
  # GET /campuses.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @campuses = Campus.paginate(pagination)
                      .includes(%i[institution status])
  end

  # GET /campuses/1
  # GET /campuses/1.json
  def show; end

  # GET /campuses/new
  def new
    @campus = Campus.new
  end

  # GET /campuses/1/edit
  def edit; end

  # POST /campuses
  # POST /campuses.json
  def create
    @campus = Campus.new(campus_params)

    respond_to do |format|
      if @campus.save
        format.html { redirect_to @campus, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @campus }
      else
        format.html { render :new }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campuses/1
  # PATCH/PUT /campuses/1.json
  def update
    respond_to do |format|
      if @campus.update(campus_params)
        format.html { redirect_to @campus, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @campus }
      else
        format.html { render :edit }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campuses/1
  # DELETE /campuses/1.json
  def destroy
    @campus.destroy
    respond_to do |format|
      format.html { redirect_to campuses_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campus
    @campus = Campus.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def campus_params
    params.require(:campus).permit(:code, :name, :description, :institution_id, :status_id)
  end
end
