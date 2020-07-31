class CampusEvaluationsController < ApplicationController
  before_action :set_campus_evaluation, only: %i[show edit update destroy]

  # GET /campus_evaluations
  # GET /campus_evaluations.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @campus_evaluations = CampusEvaluation.paginate(pagination)
  end

  # GET /campus_evaluations/1
  # GET /campus_evaluations/1.json
  def show; end

  # GET /campus_evaluations/new
  def new
    @campus_evaluation = CampusEvaluation.new
  end

  # GET /campus_evaluations/1/edit
  def edit; end

  # POST /campus_evaluations
  # POST /campus_evaluations.json
  def create
    @campus_evaluation = CampusEvaluation.new(campus_evaluation_params)

    respond_to do |format|
      if @campus_evaluation.save
        format.html { redirect_to @campus_evaluation, notice: 'Campus evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @campus_evaluation }
      else
        format.html { render :new }
        format.json { render json: @campus_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campus_evaluations/1
  # PATCH/PUT /campus_evaluations/1.json
  def update
    respond_to do |format|
      if @campus_evaluation.update(campus_evaluation_params)
        format.html { redirect_to @campus_evaluation, notice: 'Campus evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @campus_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @campus_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campus_evaluations/1
  # DELETE /campus_evaluations/1.json
  def destroy
    @campus_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to campus_evaluations_url, notice: 'Campus evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campus_evaluation
    @campus_evaluation = CampusEvaluation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def campus_evaluation_params
    params.require(:campus_evaluation).permit(:campus_id, :turn_evaluation_id)
  end
end
