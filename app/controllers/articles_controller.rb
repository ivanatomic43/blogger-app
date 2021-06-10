class ArticlesController < ApplicationController

    include ArticlesHelper

    def index
        @articles = Article.all
    end


    def show
        @article = Article.find(params[:id])

        @comment = Comment.new
        @comment.article_id = @article_id
        @author = @article.author

    
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @author = current_user

        if logged_in?
            @article.author_id = current_user.id
    
        end

        ArticleWorker.perform_async(@author.email)
        
        @article.save

        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])
        

        @comments = Comment.all

            @comments.each do |comm|
                if comm.article_id == @article.id
                    comm.destroy
                end
            end

        @article.destroy

        redirect_to action: "index"
        
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' updated!"

        redirect_to article_path(@article)
    end

    def change_status
        @article = Article.find(params[:id])
        @article.status = "Archived"
        
        @author = current_user
        HardWorker.perform_async(@author.email)

        @article.save
        
        flash.notice = "Article '#{@article.title}' is archived!"
        redirect_to action: "index"
    end

end
