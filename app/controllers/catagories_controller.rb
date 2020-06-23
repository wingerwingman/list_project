class CatagoriesController < ApplicationController

    def create 
        @category = Category.create(params[:name])
        self.update(category)
    end



    private

    def catagory_params
        params.require(:category).permit(:name)
    end
end
