# frozen_string_literal: true

# Evaluation periods controller
class EvaluationPeriodsController < ApplicationController
  before_action :set_evaluation_period, only: %i[show edit update destroy]

  # GET /evaluation_periods
  # GET /evaluation_periods.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @evaluation_periods = EvaluationPeriod.paginate(pagination)
                                          .includes(:status)
  end

  # GET /evaluation_periods/1
  # GET /evaluation_periods/1.json
  def show; end

  # GET /evaluation_periods/new
  def new
    @evaluation_period = EvaluationPeriod.new
  end

  # GET /evaluation_periods/1/edit
  def edit; end

  # POST /evaluation_periods
  # POST /evaluation_periods.json
  def create
    @evaluation_period = EvaluationPeriod.new(evaluation_period_params)

    respond_to do |format|
      if @evaluation_period.save
        format.html { redirect_to @evaluation_period, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @evaluation_period }
      else
        format.html { render :new }
        format.json { render json: @evaluation_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluation_periods/1
  # PATCH/PUT /evaluation_periods/1.json
  def update
    respond_to do |format|
      if @evaluation_period.update(evaluation_period_params)
        format.html { redirect_to @evaluation_period, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @evaluation_period }
      else
        format.html { render :edit }
        format.json { render json: @evaluation_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_periods/1
  # DELETE /evaluation_periods/1.json
  def destroy
    @evaluation_period.destroy
    respond_to do |format|
      format.html { redirect_to evaluation_periods_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation_period
    @evaluation_period = EvaluationPeriod.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def evaluation_period_params
    params.require(:evaluation_period).permit(:code, :name, :description, :status_id)
  end
end
