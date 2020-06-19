class CatagoriesController < ApplicationController

    def new 
        @catagory = Catagory.build
    end

    def create 
        @category = Category.build(category_params)
    end

    private

    def catagory_params
        params.require(:category).permit(:name)
    end
end
