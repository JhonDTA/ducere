# frozen_string_literal: true

# Student homeworks controller
class StudentHomeworksController < ApplicationController
  before_action :set_student_homework, only: %i[show edit update destroy]

  # GET /student_homeworks
  # GET /student_homeworks.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @student_homeworks = StudentHomework.paginate(pagination)
                                        .includes(index_includes)
  end

  # GET /student_homeworks/1
  # GET /student_homeworks/1.json
  def show; end

  # GET /student_homeworks/new
  def new
    @student_homework = StudentHomework.new
  end

  # GET /student_homeworks/1/edit
  def edit; end

  # POST /student_homeworks
  # POST /student_homeworks.json
  def create
    @student_homework = StudentHomework.new(student_homework_params)

    respond_to do |format|
      if @student_homework.save
        format.html { redirect_to @student_homework, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @student_homework }
      else
        format.html { render :new }
        format.json { render json: @student_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_homeworks/1
  # PATCH/PUT /student_homeworks/1.json
  def update
    respond_to do |format|
      if @student_homework.update(student_homework_params)
        format.html { redirect_to @student_homework, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @student_homework }
      else
        format.html { render :edit }
        format.json { render json: @student_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_homeworks/1
  # DELETE /student_homeworks/1.json
  def destroy
    @student_homework.destroy
    respond_to do |format|
      format.html { redirect_to student_homeworks_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student_homework
    @student_homework = StudentHomework.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_homework_params
    params.require(:student_homework).permit(:course_homework_id, :student_id, :observations)
  end

  def index_includes
    [:course_homework, { student: :user }]
  end
end
