class AttendanceTypesController < ApplicationController
  before_action :set_attendance_type, only: %i[show edit update destroy]

  # GET /attendance_types
  # GET /attendance_types.json
  def index
    @attendance_types = AttendanceType.all
  end

  # GET /attendance_types/1
  # GET /attendance_types/1.json
  def show; end

  # GET /attendance_types/new
  def new
    @attendance_type = AttendanceType.new
  end

  # GET /attendance_types/1/edit
  def edit; end

  # POST /attendance_types
  # POST /attendance_types.json
  def create
    @attendance_type = AttendanceType.new(attendance_type_params)

    respond_to do |format|
      if @attendance_type.save
        format.html { redirect_to @attendance_type, notice: 'Attendance type was successfully created.' }
        format.json { render :show, status: :created, location: @attendance_type }
      else
        format.html { render :new }
        format.json { render json: @attendance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendance_types/1
  # PATCH/PUT /attendance_types/1.json
  def update
    respond_to do |format|
      if @attendance_type.update(attendance_type_params)
        format.html { redirect_to @attendance_type, notice: 'Attendance type was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance_type }
      else
        format.html { render :edit }
        format.json { render json: @attendance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_types/1
  # DELETE /attendance_types/1.json
  def destroy
    @attendance_type.destroy
    respond_to do |format|
      format.html { redirect_to attendance_types_url, notice: 'Attendance type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance_type
    @attendance_type = AttendanceType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendance_type_params
    params.require(:attendance_type).permit(:code, :name, :description, :status_id)
  end
end
