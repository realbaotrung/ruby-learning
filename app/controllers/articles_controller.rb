class ArticlesController < ApplicationController
  def index
    # fetch all articles from the database by using the Article model
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # 'new' action instantiates a new article, but does not save it.
  # by default, it will render 'app/views/articles/new.html.erb'
  def new
    @article = Article.new
  end

  # 'create' action instantiates a new article, with values, and attempts to save it
  def create
    # NOTE: about 'article_params' really importance
    @article = Article.new(article_params)

    if @article.save
      # if the article is saved successfully, the action redirects the browser to
      # article's page "http://localhost:3000/articles/#{@article.id}"

      # It is importance to use 'redirect_to' after mutating the database or application state.
      # 'redirect_to' will cause the browser to make a new request
      redirect_to @article
    else
      # else, the action redisplays the form by rendering 'app/views/articles/new.html.erb'
      # with status code = 422 (Unprocessable Entity)
      # 'render' renders the specified view for the current request
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    # fetch article from database, call destroy on it, then redirects the browser
    # to the root path with status code '303 - see other'
    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    # this code below help filter params, make it strong params
    # really useful for 'create' and 'update' action.
    # https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    params.require(:article).permit(:title, :body, :status)
  end
end
