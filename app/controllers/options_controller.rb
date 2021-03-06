class OptionsController < ApplicationController
#before_action :authenticate_user!

before_action :set_category, only: [:index, :create]
before_action :set_option, only: [:show, :update, :destroy]

  def index
    @options = Option.all
    @options = @category.options
    @option = Option.new
  end

  def show
  end

  def create
    @option = Option.new(option_params)
    @option.category = @category
    if @option.save
      redirect_to category_options_path(@category)
    else
      render :index
    end
  end

  def update
    if @option.update(option_params)
      redirect_to category_options_path(@option.category_id)
    else
      render :show
    end
  end

  def destroy
    category = @option.category
    @option.destroy
    redirect_to category_options_path(category)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_option
    @option = Option.find(params[:id])
  end

  def option_params
    params.require(:option).permit(:name, :selected)
  end
end
