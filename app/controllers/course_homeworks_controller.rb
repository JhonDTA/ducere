# frozen_string_literal: true

# Course homeworks  controller
class CourseHomeworksController < ApplicationController
  before_action :set_course_homework, only: %i[show edit update destroy]

  # GET /course_homeworks
  # GET /course_homeworks.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @course_homeworks = CourseHomework.paginate(pagination)
  end

  # GET /course_homeworks/1
  # GET /course_homeworks/1.json
  def show; end

  # GET /course_homeworks/new
  def new
    @course_homework = CourseHomework.new
  end

  # GET /course_homeworks/1/edit
  def edit; end

  # POST /course_homeworks
  # POST /course_homeworks.json
  def create
    @course_homework = CourseHomework.new(course_homework_params)

    respond_to do |format|
      if @course_homework.save
        format.html { redirect_to @course_homework, notice: 'Course homework was successfully created.' }
        format.json { render :show, status: :created, location: @course_homework }
      else
        format.html { render :new }
        format.json { render json: @course_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_homeworks/1
  # PATCH/PUT /course_homeworks/1.json
  def update
    respond_to do |format|
      if @course_homework.update(course_homework_params)
        format.html { redirect_to @course_homework, notice: 'Course homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_homework }
      else
        format.html { render :edit }
        format.json { render json: @course_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_homeworks/1
  # DELETE /course_homeworks/1.json
  def destroy
    @course_homework.destroy
    respond_to do |format|
      format.html { redirect_to course_homeworks_url, notice: 'Course homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_homework
    @course_homework = CourseHomework.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_homework_params
    params.require(:course_homework).permit(:course_evaluation_id, :name, :description)
  end
end
