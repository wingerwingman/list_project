class CatagoriesController < ApplicationController

    def new 
        @catagory = Catagory.build
    end

    def create 
        @category = Category.find_or_create_by(params[:name])
        self.update(category)
    end



    private

    def catagory_params
        params.require(:category).permit(:name)
    end
end
