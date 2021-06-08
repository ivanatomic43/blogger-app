class TagsController < ApplicationController

    def show
        @tag = Tag.find(params[:id])
    end

    def index
        @tags = Tag.all
    end

    def destroy
        @tag = Tag.find(params[:id])
        @taggings = Tagging.all
        
        @tag.articles.each do |article|
                @taggings.each do |tagging|
                        if tagging.article_id == article.id && tagging.tag_id == @tag.id
                                 tagging.destroy
                                @tag.destroy
                        end
                end
        end

        redirect_to action: "index"
    end

end
