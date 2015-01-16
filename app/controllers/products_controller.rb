class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  impressionist actions: [:show]

  # GET /products
  # GET /products.json
  def index
    if params[:search].present?
      query = params[:search][:q].present? ? params[:search][:q] : '*'
      @search = execute_search(query, params[:page])
    else
      @search = execute_search('*', params[:page])
    end
  end

  def execute_search(query, page, per_page = 20)
    Product.search(query, page: page, per_page: per_page, facets: [:brand, :merchant])
  end

  #
  # def search_params(params={})
  #   return [nil,nil] if params.blank? || params[:search].blank?
  #   p = params[:search].dup
  #   q = p.delete(:q)
  #   [q, p]
  # end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    render json: Product.search(params[:search][:q], fields: [{product_name: :text_start}], limit: 10).map(&:product_name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit( :merchant, :affiliate_program, :brand, :active, :notes, :aw_product_id, :aw_deep_link, :aw_image_url, :aw_thumb_url, :merchant_product_id, :merchant_category, :merchant_image_url, :merchant_deep_link, :product_name, :description, :parent_product_id, :brand_name, :brand_id, :model_number, :colour, :condition, :keywords, :product_type, :promotional_text, :specifications, :currency, :search_price, :display_price, :rrp_price, :saving, :store_price, :delivery_cost, :delivery_restrictions, :delivery_time, :in_stock, :is_for_sale, :pre_order, :valid_from, :valid_to, :web_offer, :average_rating, :reviews, :rating, :last_updated)
    end
end
