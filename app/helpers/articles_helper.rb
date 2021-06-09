module ArticlesHelper

    def article_params
        params.require(:article).permit(:title, :body, :status, :tag_list, :image)
    end

end
