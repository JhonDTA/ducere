class HomeworkEvaluationsController < ApplicationController
  before_action :set_homework_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /homework_evaluations
  # GET /homework_evaluations.json
  def index
    @homework_evaluations = HomeworkEvaluation.all
  end

  # GET /homework_evaluations/1
  # GET /homework_evaluations/1.json
  def show
  end

  # GET /homework_evaluations/new
  def new
    @homework_evaluation = HomeworkEvaluation.new
  end

  # GET /homework_evaluations/1/edit
  def edit
  end

  # POST /homework_evaluations
  # POST /homework_evaluations.json
  def create
    @homework_evaluation = HomeworkEvaluation.new(homework_evaluation_params)

    respond_to do |format|
      if @homework_evaluation.save
        format.html { redirect_to @homework_evaluation, notice: 'Homework evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @homework_evaluation }
      else
        format.html { render :new }
        format.json { render json: @homework_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homework_evaluations/1
  # PATCH/PUT /homework_evaluations/1.json
  def update
    respond_to do |format|
      if @homework_evaluation.update(homework_evaluation_params)
        format.html { redirect_to @homework_evaluation, notice: 'Homework evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @homework_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homework_evaluations/1
  # DELETE /homework_evaluations/1.json
  def destroy
    @homework_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to homework_evaluations_url, notice: 'Homework evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework_evaluation
      @homework_evaluation = HomeworkEvaluation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def homework_evaluation_params
      params.require(:homework_evaluation).permit(:student_homework_id, :mark, :observations)
    end
end
