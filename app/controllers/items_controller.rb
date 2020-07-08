class ItemsController < ApplicationController
    before_action :current_list, only: [:new, :create]
    before_action :current_item,  only: [:show, :destroy]

    def new 
        current_list
        @item = @list.items.build
    end

    def create 
        current_list
        @item = @list.items.create(item_params)
        if  @item.save
            redirect_to list_path(@list)
        else 
            render "items/new"
        end
    end

    def show  
        current_item
    end

    def destroy
        current_item
        @list = @item.list_id
        @item.destroy
        redirect_to list_path(@list)
    end

    private 

    def item_params
        params.require(:item).permit(:description, :checked_off)
    end

    def current_list
        @list = current_user.lists.find_by_id(params[:list_id])
    end

    def current_item
        @item = Item.find_by(id: params[:id])
    end

end
