# frozen_string_literal: true

# Syllabuses controller
class SyllabusesController < ApplicationController
  before_action :set_syllabus, only: %i[show edit update destroy]

  # GET /syllabuses
  # GET /syllabuses.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @syllabuses = Syllabus.paginate(pagination)
                          .includes(:status)
  end

  # GET /syllabuses/1
  # GET /syllabuses/1.json
  def show; end

  # GET /syllabuses/new
  def new
    @syllabus = Syllabus.new
  end

  # GET /syllabuses/1/edit
  def edit; end

  # POST /syllabuses
  # POST /syllabuses.json
  def create
    @syllabus = Syllabus.new(syllabus_params)

    respond_to do |format|
      if @syllabus.save
        format.html { redirect_to @syllabus, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @syllabus }
      else
        format.html { render :new }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /syllabuses/1
  # PATCH/PUT /syllabuses/1.json
  def update
    respond_to do |format|
      if @syllabus.update(syllabus_params)
        format.html { redirect_to @syllabus, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @syllabus }
      else
        format.html { render :edit }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syllabuses/1
  # DELETE /syllabuses/1.json
  def destroy
    @syllabus.destroy
    respond_to do |format|
      format.html { redirect_to syllabuses_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_syllabus
    @syllabus = Syllabus.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def syllabus_params
    params.require(:syllabus).permit(:career_id, :code, :name, :description, :approval_credits, :status_id)
  end
end
