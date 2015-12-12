class ImagesController < ApplicationController
  before_action :set_image, only: [:destroy]
  before_action :set_product
  http_basic_authenticate_with name: "bedkandi", password: "5baa61e4"

  def index
    @images = @product.images
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image: params[:image].try(:[], :file))

    if @image.save
      @product.images << @image
      redirect_to action: :index, product_id: @product.id, notice: 'Image added successfully.'
    else
      render :new
    end
  end

  def destroy
    @image.destroy
    redirect_to action: :index, product_id: @product.id, notice: 'Image was successfully destroyed.'
  end

  private

  def set_image
    @image = Image.find(params[:id]) || @image.new
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
