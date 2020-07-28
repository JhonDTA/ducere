class ProfessorCoursesController < ApplicationController
  before_action :set_professor_course, only: [:show, :edit, :update, :destroy]

  # GET /professor_courses
  # GET /professor_courses.json
  def index
    @professor_courses = ProfessorCourse.all
  end

  # GET /professor_courses/1
  # GET /professor_courses/1.json
  def show
  end

  # GET /professor_courses/new
  def new
    @professor_course = ProfessorCourse.new
  end

  # GET /professor_courses/1/edit
  def edit
  end

  # POST /professor_courses
  # POST /professor_courses.json
  def create
    @professor_course = ProfessorCourse.new(professor_course_params)

    respond_to do |format|
      if @professor_course.save
        format.html { redirect_to @professor_course, notice: 'Professor course was successfully created.' }
        format.json { render :show, status: :created, location: @professor_course }
      else
        format.html { render :new }
        format.json { render json: @professor_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professor_courses/1
  # PATCH/PUT /professor_courses/1.json
  def update
    respond_to do |format|
      if @professor_course.update(professor_course_params)
        format.html { redirect_to @professor_course, notice: 'Professor course was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor_course }
      else
        format.html { render :edit }
        format.json { render json: @professor_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professor_courses/1
  # DELETE /professor_courses/1.json
  def destroy
    @professor_course.destroy
    respond_to do |format|
      format.html { redirect_to professor_courses_url, notice: 'Professor course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor_course
      @professor_course = ProfessorCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def professor_course_params
      params.require(:professor_course).permit(:professor_id, :course_id)
    end
end
