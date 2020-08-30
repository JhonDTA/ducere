class InstutionAddressesController < ApplicationController
  before_action :set_instution_address, only: %i[show edit update destroy]

  # GET /instution_addresses
  # GET /instution_addresses.json
  def index
    @instution_addresses = InstutionAddress.all
  end

  # GET /instution_addresses/1
  # GET /instution_addresses/1.json
  def show; end

  # GET /instution_addresses/new
  def new
    @instution_address = InstutionAddress.new
  end

  # GET /instution_addresses/1/edit
  def edit; end

  # POST /instution_addresses
  # POST /instution_addresses.json
  def create
    @instution_address = InstutionAddress.new(instution_address_params)

    respond_to do |format|
      if @instution_address.save
        format.html { redirect_to @instution_address, notice: 'Instution address was successfully created.' }
        format.json { render :show, status: :created, location: @instution_address }
      else
        format.html { render :new }
        format.json { render json: @instution_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instution_addresses/1
  # PATCH/PUT /instution_addresses/1.json
  def update
    respond_to do |format|
      if @instution_address.update(instution_address_params)
        format.html { redirect_to @instution_address, notice: 'Instution address was successfully updated.' }
        format.json { render :show, status: :ok, location: @instution_address }
      else
        format.html { render :edit }
        format.json { render json: @instution_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instution_addresses/1
  # DELETE /instution_addresses/1.json
  def destroy
    @instution_address.destroy
    respond_to do |format|
      format.html { redirect_to instution_addresses_url, notice: 'Instution address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instution_address
    @instution_address = InstutionAddress.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def instution_address_params
    params.require(:instution_address).permit(:institution_id, :address_id)
  end
end
