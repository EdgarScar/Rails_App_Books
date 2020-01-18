class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data

    def index
        render json: @data
    end

    def show
        @data = @data[params[:id].to_i]
    end

    def create 
        @data << {:title => params[:title], :author => params[:author]}
        render json: @data
    end 

    def update 
        @data[params[:id].to_i].update(:title => params[:title], :author => params[:author])
        render json: @data
    end 

    def destroy 
        @data.delete_at(params[:id].to_i)
        render json: @data
    end 

    private
    def setup_data
        session[:books] = [
            { title: "Harry Potter", author: "J.K Rowling" },
            { title: "Name of the wind", author: "Patrick Rothfuss" }
        ] unless session[:books]

        @data = session[:books]
    end
end 