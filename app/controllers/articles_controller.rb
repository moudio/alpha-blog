class ArticlesController < ApplicationController
before_action :set_article, only: [:edit, :update, :show, :destroy]

def index
  @articles = Article.paginate(page: params[:page], per_page: 5)
end

def new
  @article = Article.new
end

def edit

end

def create
@article = Article.new(article_params)
@article.user = User.first
if @article.save
  flash[:success] = "Article was successfully created"
redirect_to article_path(@article)
else
  render 'new'
end

end

def update
if @article.update(article_params)
  flash[:success] = "Aricle was successfully updated"
  redirect_to article_path(@article)
else
  render 'edit'
end
end


def destroy
@article.destroy
flash[:danger] = "Article was successfully deleted"
redirect_to articles_path
end

def show
end



private

def article_params

params.require(:article).permit(:title, :description)

end

def set_article
  @article = Article.find(params[:id])
end

end
