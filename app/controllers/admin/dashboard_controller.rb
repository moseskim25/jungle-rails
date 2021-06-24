class Admin::DashboardController < ApplicationController
  def show
    @num_products = Product
    @num_categories = Category
  end
end
