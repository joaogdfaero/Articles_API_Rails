module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                articles = Article.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded Articles', data:articles}, stauts: :ok
            end

            def show
                article = Article.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Article', data:article}, stauts: :ok
            end

            def create
                article = Article.new(article_params)

                if article.save
                    render json: {status: 'SUCCESS', message: 'Saved Article', data:article}, stauts: :ok
                else
                    render json: {status: 'ERROR', message: 'Article not saved', data:article.errors}, stauts: :unprocessable_entity
                end 
            end    
                

            private

            def article_params
                params.permit(:title, :body)
            end
        end
    end
end