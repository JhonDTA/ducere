class CourseEvaluationsController < ApplicationController
  before_action :set_course_evaluation, only: %i[show edit update destroy]

  # GET /course_evaluations
  # GET /course_evaluations.json
  def index
    @course_evaluations = CourseEvaluation.all
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
        format.html { redirect_to @course_evaluation, notice: 'Course evaluation was successfully created.' }
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
        format.html { redirect_to @course_evaluation, notice: 'Course evaluation was successfully updated.' }
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
      format.html { redirect_to course_evaluations_url, notice: 'Course evaluation was successfully destroyed.' }
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
end
