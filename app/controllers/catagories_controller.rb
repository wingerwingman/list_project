class CatagoriesController < ApplicationController

    def new 
        @catagory = Catagory.build
    end

    def create 
        binding.pry
        @category = Category.find_or_create_by_name(params[:name])
    end



    private

    def catagory_params
        params.require(:category).permit(:name)
    end
end
