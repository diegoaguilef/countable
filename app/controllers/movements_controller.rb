class MovementsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  protect_from_forgery except: :show
  # GET /items or /items.json
  def index
    @movements = Movement.all
    @movements.where(enterprise: params[:enterprise])
  end

  # GET /items/1 or /items/1.json
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /items/new
  def new
    @movement = Movement.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @movement = Movement.new(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to user_enterprise_path(current_user, @movement.enterprise), notice: "Movement was successfully created." }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to user_enterprise_path(current_user, @movement.enterprise), notice: "Movement was successfully updated." }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    enterprise = @movement.enterprise
    @movement.destroy
    respond_to do |format|
      format.html { redirect_to user_enterprise_path(current_user, enterprise), notice: "Movement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @movement = Movement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movement_params
    params.require(:movement).permit(:name, :description, :issue_date, :net, :total_iva, :amount, :enterprise_id, :countable_type)
  end
end
