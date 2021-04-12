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
    
    y = input[:title].split(" ")
    x = y.select { |v| v != "-" }
    xx = x.select { |v| v != "&" }
    z = xx.push(length)
    output = z.join("-").downcase!
    url = output.tr("(-).',?><!@{$%^&*}:#", "")
    

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
    @article = Article.find_by(url: params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:title, :subtitles, :author, :notes, :rt, :category, :breaking, :subcategory, :photos, :body, :categorization_id, :subcategorization_id)
  end
end
