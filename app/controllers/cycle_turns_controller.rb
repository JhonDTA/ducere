# frozen_string_literal: true

# Cycle turns controller
class CycleTurnsController < ApplicationController
  before_action :set_cycle_turn, only: %i[show edit update destroy]

  # GET /cycle_turns
  # GET /cycle_turns.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @cycle_turns = CycleTurn.paginate(pagination)
                            .includes(index_includes)
  end

  # GET /cycle_turns/1
  # GET /cycle_turns/1.json
  def show; end

  # GET /cycle_turns/new
  def new
    @cycle_turn = CycleTurn.new
  end

  # GET /cycle_turns/1/edit
  def edit; end

  # POST /cycle_turns
  # POST /cycle_turns.json
  def create
    @cycle_turn = CycleTurn.new(cycle_turn_params)

    respond_to do |format|
      if @cycle_turn.save
        format.html { redirect_to @cycle_turn, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @cycle_turn }
      else
        format.html { render :new }
        format.json { render json: @cycle_turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cycle_turns/1
  # PATCH/PUT /cycle_turns/1.json
  def update
    respond_to do |format|
      if @cycle_turn.update(cycle_turn_params)
        format.html { redirect_to @cycle_turn, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @cycle_turn }
      else
        format.html { render :edit }
        format.json { render json: @cycle_turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycle_turns/1
  # DELETE /cycle_turns/1.json
  def destroy
    @cycle_turn.destroy
    respond_to do |format|
      format.html { redirect_to cycle_turns_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cycle_turn
    @cycle_turn = CycleTurn.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cycle_turn_params
    params.require(:cycle_turn).permit(:cycle_modality_id, :turn_id)
  end

  def index_includes
    [{ cycle_modality: %i[academic_cycle modality] }, :turn]
  end
end
