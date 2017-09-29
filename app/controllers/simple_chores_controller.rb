class SimpleChoresController < ApplicationController
  before_action :set_simple_chore, only: [:show, :edit, :update, :destroy]

  # GET /simple_chores
  # GET /simple_chores.json
  def index
    @simple_chores = SimpleChore.all
    respond_to do |format|
      format.html
      format.json { render :json => @simple_chores }
    end
  end

  # GET /simple_chores/1
  # GET /simple_chores/1.json
  def show
  end

  # GET /simple_chores/new
  def new
    @simple_chore = SimpleChore.new
  end

  # GET /simple_chores/1/edit
  def edit
  end

  # POST /simple_chores
  # POST /simple_chores.json
  def create
    @simple_chore = SimpleChore.new(simple_chore_params)

    respond_to do |format|
      if @simple_chore.save
        format.html { redirect_to @simple_chore, notice: 'Simple chore was successfully created.' }
        format.json { render :show, status: :created, location: @simple_chore }
      else
        format.html { render :new }
        format.json { render json: @simple_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simple_chores/1
  # PATCH/PUT /simple_chores/1.json
  def update
    respond_to do |format|
      if @simple_chore.update(simple_chore_params)
        format.html { redirect_to @simple_chore, notice: 'Simple chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @simple_chore }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @simple_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_chores/1
  # DELETE /simple_chores/1.json
  def destroy
    @simple_chore.destroy
    respond_to do |format|
      format.html { redirect_to simple_chores_url, notice: 'Simple chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simple_chore
      @simple_chore = SimpleChore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simple_chore_params
      params.require(:simple_chore).permit(:name, :completed)
    end
end
