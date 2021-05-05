require "http"
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all.order(id: :desc)
    now = Time.zone.now.strftime("%Y-%m-%dT%H:%M:%S")
    art =  @articles.where('publish_time < ?', now).or(@articles.where(publish_time: nil))

    
    # byebug 

    render json: art
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
    length =  Article.all.count
    
    y = input[:url].split(" ")
    x = y.select { |v| v != "-" }
    xx = x.select { |v| v != "&" }
    z = xx.push(length)
    output = z.join("-").downcase
    url = output
    # byebug
    if input[:breaking]
      publish_time = nil
    else
      publish_time = input[:publishTime]
      # byebug
    end
    # byebug
    #date
    date = Date.today

# byebug
    @article = Article.new({
      title: input[:title],
      subtitles: input[:subtitles],
      author: input[:author],
      body: input[:body],
      breaking: input[:breaking],
      photos: input[:photos],
      fallback: input[:photos],
      rt: input[:rt],
      originalPost: date.strftime("%m/%d/%Y"),
      legacy: false,
      categorization: category,
      subcategorization: subcategory,
      url: url,
      publish_time: publish_time,
    })
    if input[:breaking] === true 
      HTTP.post("https://api.vercel.com/v1/integrations/deploy/prj_IyLVq5fc7aXdQctLkHAuKqOpepkw/FTeVTgMhXC")    
    end

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    title = params[:updatedArticle][:title]
    author  = params[:updatedArticle][:author]
    photos  = params[:updatedArticle][:photos]
    subtitles = params[:updatedArticle][:rt]
    rt = params[:updatedArticle][:rt]
    subcategorization_id = params[:updatedArticle][:subcategorization_id]
    categorization_id = params[:updatedArticle][:categorization_id]
    body = params[:updatedArticle][:body]
    @article.title = title
    @article.author = author
    @article.photos = photos
    @article.subtitles = subtitles
    @article.rt = rt
    @article.subcategorization_id = subcategorization_id
    @article.categorization_id = categorization_id
    @article.body = body
    if @article.save
      HTTP.post("https://api.vercel.com/v1/integrations/deploy/prj_IyLVq5fc7aXdQctLkHAuKqOpepkw/FTeVTgMhXC")
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end


  def search
      params[:output] 
      @articles = Article.where("lower(title) LIKE lower(?)", "%#{params[:output]}%")      
      # byebug
    
      render json: {articles: @articles.first(25)},status: :ok
    
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
