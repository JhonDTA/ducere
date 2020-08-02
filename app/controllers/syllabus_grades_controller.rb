# frozen_string_literal: true

# Syllabus grades controller
class SyllabusGradesController < ApplicationController
  before_action :set_syllabus_grade, only: %i[show edit update destroy]

  # GET /syllabus_grades
  # GET /syllabus_grades.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @syllabus_grades = SyllabusGrade.paginate(pagination)
  end

  # GET /syllabus_grades/1
  # GET /syllabus_grades/1.json
  def show; end

  # GET /syllabus_grades/new
  def new
    @syllabus_grade = SyllabusGrade.new
  end

  # GET /syllabus_grades/1/edit
  def edit; end

  # POST /syllabus_grades
  # POST /syllabus_grades.json
  def create
    @syllabus_grade = SyllabusGrade.new(syllabus_grade_params)

    respond_to do |format|
      if @syllabus_grade.save
        format.html { redirect_to @syllabus_grade, notice: 'Syllabus grade was successfully created.' }
        format.json { render :show, status: :created, location: @syllabus_grade }
      else
        format.html { render :new }
        format.json { render json: @syllabus_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /syllabus_grades/1
  # PATCH/PUT /syllabus_grades/1.json
  def update
    respond_to do |format|
      if @syllabus_grade.update(syllabus_grade_params)
        format.html { redirect_to @syllabus_grade, notice: 'Syllabus grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @syllabus_grade }
      else
        format.html { render :edit }
        format.json { render json: @syllabus_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syllabus_grades/1
  # DELETE /syllabus_grades/1.json
  def destroy
    @syllabus_grade.destroy
    respond_to do |format|
      format.html { redirect_to syllabus_grades_url, notice: 'Syllabus grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_syllabus_grade
    @syllabus_grade = SyllabusGrade.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def syllabus_grade_params
    params.require(:syllabus_grade).permit(:career_syllabus_id, :grade_id)
  end
end
