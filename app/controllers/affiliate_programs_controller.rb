class AffiliateProgramsController < ApplicationController
  before_action :set_affiliate_program, only: [:show, :edit, :update, :destroy]

  # GET /affiliate_programs
  # GET /affiliate_programs.json
  def index
    @affiliate_programs = AffiliateProgram.all
  end

  # GET /affiliate_programs/1
  # GET /affiliate_programs/1.json
  def show
  end

  # GET /affiliate_programs/new
  def new
    @affiliate_program = AffiliateProgram.new
  end

  # GET /affiliate_programs/1/edit
  def edit
  end

  # POST /affiliate_programs
  # POST /affiliate_programs.json
  def create
    @affiliate_program = AffiliateProgram.new(affiliate_program_params)

    respond_to do |format|
      if @affiliate_program.save
        format.html { redirect_to @affiliate_program, notice: 'Affiliate program was successfully created.' }
        format.json { render :show, status: :created, location: @affiliate_program }
      else
        format.html { render :new }
        format.json { render json: @affiliate_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affiliate_programs/1
  # PATCH/PUT /affiliate_programs/1.json
  def update
    respond_to do |format|
      if @affiliate_program.update(affiliate_program_params)
        format.html { redirect_to @affiliate_program, notice: 'Affiliate program was successfully updated.' }
        format.json { render :show, status: :ok, location: @affiliate_program }
      else
        format.html { render :edit }
        format.json { render json: @affiliate_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliate_programs/1
  # DELETE /affiliate_programs/1.json
  def destroy
    @affiliate_program.destroy
    respond_to do |format|
      format.html { redirect_to affiliate_programs_url, notice: 'Affiliate program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affiliate_program
      @affiliate_program = AffiliateProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def affiliate_program_params
      params.require(:affiliate_program).permit(:name, :display_name, :description)
    end
end
