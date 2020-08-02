# frozen_string_literal: true

# Evaluation attendances controller
class EvaluationAttendancesController < ApplicationController
  before_action :set_evaluation_attendance, only: %i[show edit update destroy]

  # GET /evaluation_attendances
  # GET /evaluation_attendances.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @evaluation_attendances = EvaluationAttendance.paginate(pagination)
  end

  # GET /evaluation_attendances/1
  # GET /evaluation_attendances/1.json
  def show; end

  # GET /evaluation_attendances/new
  def new
    @evaluation_attendance = EvaluationAttendance.new
  end

  # GET /evaluation_attendances/1/edit
  def edit; end

  # POST /evaluation_attendances
  # POST /evaluation_attendances.json
  def create
    @evaluation_attendance = EvaluationAttendance.new(evaluation_attendance_params)

    respond_to do |format|
      if @evaluation_attendance.save
        format.html { redirect_to @evaluation_attendance, notice: 'Evaluation attendance was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation_attendance }
      else
        format.html { render :new }
        format.json { render json: @evaluation_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluation_attendances/1
  # PATCH/PUT /evaluation_attendances/1.json
  def update
    respond_to do |format|
      if @evaluation_attendance.update(evaluation_attendance_params)
        format.html { redirect_to @evaluation_attendance, notice: 'Evaluation attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation_attendance }
      else
        format.html { render :edit }
        format.json { render json: @evaluation_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_attendances/1
  # DELETE /evaluation_attendances/1.json
  def destroy
    @evaluation_attendance.destroy
    respond_to do |format|
      format.html { redirect_to evaluation_attendances_url, notice: 'Evaluation attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation_attendance
    @evaluation_attendance = EvaluationAttendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def evaluation_attendance_params
    params.require(:evaluation_attendance).permit(:student_id, :course_evaluation_id, :attendance_type_id, :date)
  end
end
