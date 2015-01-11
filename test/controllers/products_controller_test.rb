require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { active: @product.active, affiliate_program: @product.affiliate_program, average_rating: @product.average_rating, basket_link: @product.basket_link, brand_name: @product.brand_name, colour: @product.colour, commission_group: @product.commission_group, condition: @product.condition, currency: @product.currency, deep_link: @product.deep_link, delivery_cost: @product.delivery_cost, delivery_cost: @product.delivery_cost, delivery_restrictions: @product.delivery_restrictions, delivery_time: @product.delivery_time, description: @product.description, dimensions: @product.dimensions, ean: @product.ean, image_url: @product.image_url, in_stock: @product.in_stock, is_for_sale: @product.is_for_sale, isbn: @product.isbn, keywords: @product.keywords, language: @product.language, last_updated: @product.last_updated, merchant_category: @product.merchant_category, merchant_image: @product.merchant_image, merchant_thumb: @product.merchant_thumb, model_number: @product.model_number, mpn: @product.mpn, notes: @product.notes, parent_product_id: @product.parent_product_id, pre_order: @product.pre_order, price: @product.price, price: @product.price, product_id: @product.product_id, product_name: @product.product_name, product_type: @product.product_type, product_weight: @product.product_weight, promotional_text: @product.promotional_text, rating: @product.rating, reviews: @product.reviews, rrp_price: @product.rrp_price, rrp_price: @product.rrp_price, saving: @product.saving, specifications: @product.specifications, stock_quantity: @product.stock_quantity, store_price: @product.store_price, store_price: @product.store_price, thumb_url: @product.thumb_url, upc: @product.upc, valid_from: @product.valid_from, valid_to: @product.valid_to, warranty: @product.warranty, web_offer: @product.web_offer }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { active: @product.active, affiliate_program: @product.affiliate_program, average_rating: @product.average_rating, basket_link: @product.basket_link, brand_name: @product.brand_name, colour: @product.colour, commission_group: @product.commission_group, condition: @product.condition, currency: @product.currency, deep_link: @product.deep_link, delivery_cost: @product.delivery_cost, delivery_cost: @product.delivery_cost, delivery_restrictions: @product.delivery_restrictions, delivery_time: @product.delivery_time, description: @product.description, dimensions: @product.dimensions, ean: @product.ean, image_url: @product.image_url, in_stock: @product.in_stock, is_for_sale: @product.is_for_sale, isbn: @product.isbn, keywords: @product.keywords, language: @product.language, last_updated: @product.last_updated, merchant_category: @product.merchant_category, merchant_image: @product.merchant_image, merchant_thumb: @product.merchant_thumb, model_number: @product.model_number, mpn: @product.mpn, notes: @product.notes, parent_product_id: @product.parent_product_id, pre_order: @product.pre_order, price: @product.price, price: @product.price, product_id: @product.product_id, product_name: @product.product_name, product_type: @product.product_type, product_weight: @product.product_weight, promotional_text: @product.promotional_text, rating: @product.rating, reviews: @product.reviews, rrp_price: @product.rrp_price, rrp_price: @product.rrp_price, saving: @product.saving, specifications: @product.specifications, stock_quantity: @product.stock_quantity, store_price: @product.store_price, store_price: @product.store_price, thumb_url: @product.thumb_url, upc: @product.upc, valid_from: @product.valid_from, valid_to: @product.valid_to, warranty: @product.warranty, web_offer: @product.web_offer }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
