class TurnsController < ApplicationController
  before_action :set_turn, only: %i[show edit update destroy]

  # GET /turns
  # GET /turns.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @turns = Turn.paginate(pagination)
  end

  # GET /turns/1
  # GET /turns/1.json
  def show; end

  # GET /turns/new
  def new
    @turn = Turn.new
  end

  # GET /turns/1/edit
  def edit; end

  # POST /turns
  # POST /turns.json
  def create
    @turn = Turn.new(turn_params)

    respond_to do |format|
      if @turn.save
        format.html { redirect_to @turn, notice: 'Turn was successfully created.' }
        format.json { render :show, status: :created, location: @turn }
      else
        format.html { render :new }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turns/1
  # PATCH/PUT /turns/1.json
  def update
    respond_to do |format|
      if @turn.update(turn_params)
        format.html { redirect_to @turn, notice: 'Turn was successfully updated.' }
        format.json { render :show, status: :ok, location: @turn }
      else
        format.html { render :edit }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turns/1
  # DELETE /turns/1.json
  def destroy
    @turn.destroy
    respond_to do |format|
      format.html { redirect_to turns_url, notice: 'Turn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_turn
    @turn = Turn.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def turn_params
    params.require(:turn).permit(:code, :name, :description, :start, :finish, :status_id)
  end
end
