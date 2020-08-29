# frozen_string_literal: true

# Career syllabuses controller
class CareerSyllabusesController < ApplicationController
  before_action :set_career_syllabus, only: %i[show edit update destroy]

  # GET /career_syllabuses
  # GET /career_syllabuses.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    includes = %i[career syllabus]
    @career_syllabuses = CareerSyllabus.paginate(pagination)
                                       .includes(includes)
  end

  # GET /career_syllabuses/1
  # GET /career_syllabuses/1.json
  def show; end

  # GET /career_syllabuses/new
  def new
    @career_syllabus = CareerSyllabus.new
  end

  # GET /career_syllabuses/1/edit
  def edit; end

  # POST /career_syllabuses
  # POST /career_syllabuses.json
  def create
    @career_syllabus = CareerSyllabus.new(career_syllabus_params)

    respond_to do |format|
      if @career_syllabus.save
        format.html { redirect_to @career_syllabus, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @career_syllabus }
      else
        format.html { render :new }
        format.json { render json: @career_syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /career_syllabuses/1
  # PATCH/PUT /career_syllabuses/1.json
  def update
    respond_to do |format|
      if @career_syllabus.update(career_syllabus_params)
        format.html { redirect_to @career_syllabus, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @career_syllabus }
      else
        format.html { render :edit }
        format.json { render json: @career_syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /career_syllabuses/1
  # DELETE /career_syllabuses/1.json
  def destroy
    @career_syllabus.destroy
    respond_to do |format|
      format.html { redirect_to career_syllabuses_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_career_syllabus
    @career_syllabus = CareerSyllabus.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def career_syllabus_params
    params.require(:career_syllabus).permit(:career_id, :syllabus_id)
  end
end
