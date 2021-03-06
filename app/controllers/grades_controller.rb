# frozen_string_literal: true

# Grades controller
class GradesController < ApplicationController
  before_action :set_grade, only: %i[show edit update destroy]

  # GET /grades
  # GET /grades.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @grades = Grade.paginate(pagination).includes(:status)
  end

  # GET /grades/1
  # GET /grades/1.json
  def show; end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit; end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grade
    @grade = Grade.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def grade_params
    params.require(:grade).permit(:name, :description, :sequence, :status_id)
  end
end
