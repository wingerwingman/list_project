class CatagoriesController < ApplicationController

    def new 
        @catagory = Catagory.new
    end

    def create 
        @category = Category.new(category_params)
    end

    private

    def catagory_params
        # params[:category][:list_attributes].delete(:__template_row__)
        params.require(:category).permit(:name)
    end
end
