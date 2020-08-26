# frozen_string_literal: true

# Settlements controller
class SettlementsController < ApplicationController
  before_action :set_settlement, only: %i[show edit update destroy]

  # GET /settlements
  # GET /settlements.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @settlements = Settlement.paginate(pagination).includes(:municipality)
  end

  # GET /settlements/1
  # GET /settlements/1.json
  def show; end

  # GET /settlements/new
  def new
    @settlement = Settlement.new
  end

  # GET /settlements/1/edit
  def edit; end

  # POST /settlements
  # POST /settlements.json
  def create
    @settlement = Settlement.new(settlement_params)

    respond_to do |format|
      if @settlement.save
        format.html { redirect_to @settlement, notice: 'Settlement was successfully created.' }
        format.json { render :show, status: :created, location: @settlement }
      else
        format.html { render :new }
        format.json { render json: @settlement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settlements/1
  # PATCH/PUT /settlements/1.json
  def update
    respond_to do |format|
      if @settlement.update(settlement_params)
        format.html { redirect_to @settlement, notice: 'Settlement was successfully updated.' }
        format.json { render :show, status: :ok, location: @settlement }
      else
        format.html { render :edit }
        format.json { render json: @settlement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settlements/1
  # DELETE /settlements/1.json
  def destroy
    @settlement.destroy
    respond_to do |format|
      format.html { redirect_to settlements_url, notice: 'Settlement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_settlement
    @settlement = Settlement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def settlement_params
    params.require(:settlement).permit(:municipality_id, :name, :zip_code)
  end
end
