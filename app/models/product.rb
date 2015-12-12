class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations

  has_many :images, dependent: :destroy

  has_many :package_component_packages, class_name: 'PackageComponent', foreign_key: 'component_id'
  has_many :packages, through: :package_component_packages

  has_many :package_component_components, class_name: 'PackageComponent', foreign_key: 'package_id'
  has_many :components, through: :package_component_components

  has_many :order_products
  has_many :orders, through: :order_products

  belongs_to :list_image, class_name: 'Image', foreign_key: 'list_image', dependent: :destroy

  before_save :set_list_image_url

  def self.new params = {}
    params[:categories] = params[:categories].map { |cat| Category.find_by_id cat } if params[:categories]
    params[:components] = params[:components].map { |com| Product.find_by_id com } if params[:components]
    params[:list_image] = Image.create(image: params[:list_image]) if params[:list_image]
    super
  end

  def update params = {}
    params[:categories] = params[:categories].map { |cat| Category.find_by_id cat } if params[:categories]
    params[:components] = params[:components].map { |com| Product.find_by_id com } if params[:components]
    params[:list_image] = Image.create(image: params[:list_image]) if params[:list_image]
    super
  end

  def self.find_products category_id, spicy_level, per_page = nil, page = nil
    page     ||= 1
    per_page ||= 9

    products = Product.joins(:categorizations).joins(:categories)
    products = products.where(categories: {id: category_id}) if category_id
    products = products.where spicy_level: spicy_level if spicy_level
    products = products.offset(page - 1).take(per_page)
  end

  private

  def set_list_image_url
    self.list_image_url = list_image.image.url if list_image
  end

end
