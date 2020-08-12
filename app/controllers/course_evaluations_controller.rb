# frozen_string_literal: true

# Course evaluations controller
class CourseEvaluationsController < ApplicationController
  before_action :set_course_evaluation, only: %i[show edit update destroy]

  # GET /course_evaluations
  # GET /course_evaluations.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @course_evaluations = CourseEvaluation.paginate(pagination)
                                          .includes(index_includes)
  end

  # GET /course_evaluations/1
  # GET /course_evaluations/1.json
  def show; end

  # GET /course_evaluations/new
  def new
    @course_evaluation = CourseEvaluation.new
  end

  # GET /course_evaluations/1/edit
  def edit; end

  # POST /course_evaluations
  # POST /course_evaluations.json
  def create
    @course_evaluation = CourseEvaluation.new(course_evaluation_params)

    respond_to do |format|
      if @course_evaluation.save
        format.html { redirect_to @course_evaluation, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @course_evaluation }
      else
        format.html { render :new }
        format.json { render json: @course_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_evaluations/1
  # PATCH/PUT /course_evaluations/1.json
  def update
    respond_to do |format|
      if @course_evaluation.update(course_evaluation_params)
        format.html { redirect_to @course_evaluation, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @course_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @course_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_evaluations/1
  # DELETE /course_evaluations/1.json
  def destroy
    @course_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to course_evaluations_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_evaluation
    @course_evaluation = CourseEvaluation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_evaluation_params
    params.require(:course_evaluation).permit(:grade_course_id, :campus_evaluation_id, :professor_id, :group_id)
  end

  def index_includes
    [{ grade_course:
           [{ syllabus_grade:
                  [{ career_syllabus:
                         [{ level_career: %i[educative_level career] },
                          :syllabus] }, :grade] }, :course] },
     { campus_evaluation:
           [{ turn_evaluation:
                  [{ cycle_turn:
                         [{ cycle_modality: %i[academic_cycle modality] },
                          :turn] },
                   :evaluation_period] },
            :campus] }, { professor: :user }, :group]
  end
end
