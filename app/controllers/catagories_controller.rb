class CatagoriesController < ApplicationController

    def new 
        @catagory = Catagory.build
    end

    def create 
        binding.pry
        if !category = Category.find_by(name: params[:name])
        @category = Category.find_or_create_by(params[:name])
        self.update(category)
        end
    end



    private

    def catagory_params
        params.require(:category).permit(:name)
    end
end
