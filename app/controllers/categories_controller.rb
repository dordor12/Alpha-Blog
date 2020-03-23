class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update]
  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find params[:id]
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = 'category added sucssefuly'
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update category_params
      flash[:success] = 'Category sucssefuly edited'
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || !current_user.admin?
      flash[:danger] = 'only admin users can prefom this action'
      redirect_to categories_path
    end
  end
end
