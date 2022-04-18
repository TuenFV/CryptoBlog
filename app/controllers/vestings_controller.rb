class VestingsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_pool
  before_action :set_vesting, only: %i[ show edit update destroy ]
  # GET /vestings or /vestings.json
  def index
    @vestings = @pool.vestings.order(:date).page params[:page]
  end

  # GET /vestings/new
  def new
    @vesting = @pool.vestings.build()

    @defaut_date = !@pool.vestings.second_to_last.nil? ? @pool.vestings.second_to_last.date : Date.today
    @defaut_rate = !@pool.vestings.second_to_last.nil? ? @pool.vestings.second_to_last.rate : 0
  end

  # GET /vestings/1/edit
  def edit
  end



  # POST /vestings or /vestings.json
  def create
    @vesting = @pool.vestings.build(vesting_params)

    respond_to do |format|
      if @vesting.save
        format.html { redirect_to pool_vestings_path notice: "Vesting was successfully created." }
        format.json { render :show, status: :created, location: @vesting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vesting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vestings/1 or /vestings/1.json
  def update
    respond_to do |format|
      if @vesting.update(vesting_params)
        format.html { redirect_to pool_vestings_path, notice: "Vesting was successfully updated." }
        format.json { render :show, status: :ok, location: @vesting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vesting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vestings/1 or /vestings/1.json
  def destroy
    @vesting.destroy

    respond_to do |format|
      format.html { redirect_to pool_vestings_path(@pool), notice: "Vesting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_pool
      begin
        @pool = current_user.pools.find(params[:pool_id])
      rescue #if this pool does not belong to current_user, back to pools
        redirect_to pools_path if @pool.nil?
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_vesting
      @vesting = @pool.vestings.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vesting_params
      params.require(:vesting).permit(:date, :rate, :soldtoken, :return, :pool_id )
    end
end
