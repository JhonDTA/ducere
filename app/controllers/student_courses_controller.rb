class StudentCoursesController < ApplicationController
  before_action :set_student_course, only: %i[show edit update destroy]

  # GET /student_courses
  # GET /student_courses.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @student_courses = StudentCourse.paginate(pagination)
  end

  # GET /student_courses/1
  # GET /student_courses/1.json
  def show; end

  # GET /student_courses/new
  def new
    @student_course = StudentCourse.new
  end

  # GET /student_courses/1/edit
  def edit; end

  # POST /student_courses
  # POST /student_courses.json
  def create
    @student_course = StudentCourse.new(student_course_params)

    respond_to do |format|
      if @student_course.save
        format.html { redirect_to @student_course, notice: 'Student course was successfully created.' }
        format.json { render :show, status: :created, location: @student_course }
      else
        format.html { render :new }
        format.json { render json: @student_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_courses/1
  # PATCH/PUT /student_courses/1.json
  def update
    respond_to do |format|
      if @student_course.update(student_course_params)
        format.html { redirect_to @student_course, notice: 'Student course was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_course }
      else
        format.html { render :edit }
        format.json { render json: @student_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_courses/1
  # DELETE /student_courses/1.json
  def destroy
    @student_course.destroy
    respond_to do |format|
      format.html { redirect_to student_courses_url, notice: 'Student course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student_course
    @student_course = StudentCourse.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_course_params
    params.require(:student_course).permit(:student_id, :course_evaluation_id)
  end
end
