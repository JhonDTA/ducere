# frozen_string_literal: true

# Turn evaluations controller
class TurnEvaluationsController < ApplicationController
  before_action :set_turn_evaluation, only: %i[show edit update destroy]

  # GET /turn_evaluations
  # GET /turn_evaluations.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @turn_evaluations = TurnEvaluation.paginate(pagination)
                                      .includes(index_includes)
  end

  # GET /turn_evaluations/1
  # GET /turn_evaluations/1.json
  def show; end

  # GET /turn_evaluations/new
  def new
    @turn_evaluation = TurnEvaluation.new
  end

  # GET /turn_evaluations/1/edit
  def edit; end

  # POST /turn_evaluations
  # POST /turn_evaluations.json
  def create
    @turn_evaluation = TurnEvaluation.new(turn_evaluation_params)

    respond_to do |format|
      if @turn_evaluation.save
        format.html { redirect_to @turn_evaluation, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @turn_evaluation }
      else
        format.html { render :new }
        format.json { render json: @turn_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turn_evaluations/1
  # PATCH/PUT /turn_evaluations/1.json
  def update
    respond_to do |format|
      if @turn_evaluation.update(turn_evaluation_params)
        format.html { redirect_to @turn_evaluation, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @turn_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @turn_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turn_evaluations/1
  # DELETE /turn_evaluations/1.json
  def destroy
    @turn_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to turn_evaluations_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_turn_evaluation
    @turn_evaluation = TurnEvaluation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def turn_evaluation_params
    params.require(:turn_evaluation).permit(:cycle_turn_id, :evaluation_period_id)
  end

  def index_includes
    [{ cycle_turn:
           [{ cycle_modality:
                  %i[academic_cycle modality] },
            :turn] }, :evaluation_period]
  end
end
