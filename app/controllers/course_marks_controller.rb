# frozen_string_literal: true

# Course marks controller
class CourseMarksController < ApplicationController
  before_action :set_course_mark, only: %i[show edit update destroy]

  # GET /course_marks
  # GET /course_marks.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @course_marks = CourseMark.paginate(pagination)
                              .includes(index_includes)
  end

  # GET /course_marks/1
  # GET /course_marks/1.json
  def show; end

  # GET /course_marks/new
  def new
    @course_mark = CourseMark.new
  end

  # GET /course_marks/1/edit
  def edit; end

  # POST /course_marks
  # POST /course_marks.json
  def create
    @course_mark = CourseMark.new(course_mark_params)

    respond_to do |format|
      if @course_mark.save
        format.html { redirect_to @course_mark, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @course_mark }
      else
        format.html { render :new }
        format.json { render json: @course_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_marks/1
  # PATCH/PUT /course_marks/1.json
  def update
    respond_to do |format|
      if @course_mark.update(course_mark_params)
        format.html { redirect_to @course_mark, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @course_mark }
      else
        format.html { render :edit }
        format.json { render json: @course_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_marks/1
  # DELETE /course_marks/1.json
  def destroy
    @course_mark.destroy
    respond_to do |format|
      format.html { redirect_to course_marks_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_mark
    @course_mark = CourseMark.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_mark_params
    params.require(:course_mark).permit(:student_course_id, :mark, :attendance, :observations)
  end

  def index_includes
    { student_course:
          [{ course_evaluation:
                 [{ grade_course:
                        [{ syllabus_grade: %i[syllabus grade] }, :course] },
                  { campus_evaluation:
                        [{ turn_evaluation:
                               [{ cycle_turn:
                                      [{ cycle_modality:
                                             %i[academic_cycle modality] },
                                       :turn] },
                                :evaluation_period] },
                         :campus] },
                  { professor: :user }, :group] },
           { student: :user }] }
  end
end
