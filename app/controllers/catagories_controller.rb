class CatagoriesController < ApplicationController

    def new 
        @catagory = Catagory.build
    end

    def create 
        @category = Category.find_or_create_by(name: name)
    end

    def edit 
        @category = Category.find_by(params[:id])
    end

    def update 
        @category = Category.find_by(params[:id])
        @category.update(category_params)
    end

    private

    def catagory_params
        params.require(:category).permit(:name)
    end
end
