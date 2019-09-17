class ArticlesController < ApplicationController
  before_action :authorize_request, except: %i[index show]
  before_action :find_article, except: %i[create index]

  # GET all articles
  def index
    @articles = Article.all
    render json: @articles, status: :ok
  end

  # GET single article
  def show
    render json: @article, status: :ok
  end

  # POST create articles
  def create
    if @current_user
      @article = Article.new(article_params.merge(user_id: @current_user.id))
      if @article.save
        render json: @article, status: :created, message: "Article created"
      else
        render json: { errors: @article.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end

  # DELETE an article
  def destroy
    @article.destroy
    render json: { message: "Deleted" }, status: :ok
  end

  #UPDATE articles
  def update
    @article.update(article_params)
    render json: { message: "Updated successfully" }
  end

  private

  def find_article
    @article = Article.find_by_title!(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Article not found' },
            status: :not_found
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
