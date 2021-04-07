class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    
    @articles = Article.all.order(id: :desc)

    render json: @articles
  end

  # GET /articles/1
  def show
  # byebug
    render json: @article
  end

  # POST /articles
  def create
    puts params
    input = params[:article]
    cat_id = input[:category]
    sub_cat = input[:subcategory]
    category = Categorization.find(cat_id.to_i)

    case sub_cat.to_i
    when 1
      subcategory = Subcategorization.find(sub_cat.to_i) 
    when 2
      subcategory = Subcategorization.find(sub_cat.to_i)
    when 3
      subcategory = Subcategorization.find(sub_cat.to_i)
    when 4
      subcategory = Subcategorization.find(sub_cat.to_i)
    when 5
      subcategory = Subcategorization.find(sub_cat.to_i)
    else
      subcategory = nil
    end
    # byebug
    
    #date
date = Date.today
    @article = Article.new({
      title: input[:title],
      subtitles: input[:subtitles],
      author: input[:author],
      body: input[:body],
      breaking: input[:breaking],
      photos: input[:photos],
      fallback: input[:photos],
      rt: input[:rt],
      originalPost: date.strftime("%d/%m/%Y"),
      legacy: false,
      categorization: category,
      subcategorization: subcategory,
    })
    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    # byebug
    @article = Article.find_by(url: params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:title, :subtitles, :author, :notes, :rt, :category, :breaking, :subcategory, :photos, :body, :categorization_id, :subcategorization_id)
  end
end
