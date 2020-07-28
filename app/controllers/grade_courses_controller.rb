class GradeCoursesController < ApplicationController
  before_action :set_grade_course, only: %i[show edit update destroy]

  # GET /grade_courses
  # GET /grade_courses.json
  def index
    @grade_courses = GradeCourse.all
  end

  # GET /grade_courses/1
  # GET /grade_courses/1.json
  def show; end

  # GET /grade_courses/new
  def new
    @grade_course = GradeCourse.new
  end

  # GET /grade_courses/1/edit
  def edit; end

  # POST /grade_courses
  # POST /grade_courses.json
  def create
    @grade_course = GradeCourse.new(grade_course_params)

    respond_to do |format|
      if @grade_course.save
        format.html { redirect_to @grade_course, notice: 'Grade course was successfully created.' }
        format.json { render :show, status: :created, location: @grade_course }
      else
        format.html { render :new }
        format.json { render json: @grade_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grade_courses/1
  # PATCH/PUT /grade_courses/1.json
  def update
    respond_to do |format|
      if @grade_course.update(grade_course_params)
        format.html { redirect_to @grade_course, notice: 'Grade course was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade_course }
      else
        format.html { render :edit }
        format.json { render json: @grade_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grade_courses/1
  # DELETE /grade_courses/1.json
  def destroy
    @grade_course.destroy
    respond_to do |format|
      format.html { redirect_to grade_courses_url, notice: 'Grade course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grade_course
    @grade_course = GradeCourse.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def grade_course_params
    params.require(:grade_course).permit(:syllabus_grade_id, :course_id)
  end
end
