class ListsController < ApplicationController
    before_action :require_permission, only: :show

    def require_permission
        if current_user != List.find(params[:id]).user
            redirect_to lists_path
        end
    end


    def index 
        @user = current_user
        @lists = @user.lists.all
    end

    def new
        @list = current_user.lists.items.build
    end

    def create 
        binding.pry
        @list = current_user.lists.items.build(list_params)
        if @list.save
            redirect_to list_path(@list)
        else
            render 'new'
        end
    end

    def edit 
        @list = current_user.lists.find_by(params[:id])
    end

    def update 
        @list = current_user.lists.find_by(params[:id])
        @list.update(list_params)
        redirect_to list_path
    end

    def show 

        @list = current_user.lists.find_by(params[:id])

        binding.pry
        # @items = Item.joins(lists: params[:id])
        # @items = Item.find_by(list_id: params[:list_id])
        # binding.pry
        # @list_items = @list.list_items.find_by(params[:list_id])
        # binding.pry
        # @items = Item.list_id.find_by(@list_items)
    end

    def destroy
        @list = current_user.lists.find_by(id: params[:id])
        @list.destroy
        redirect_to lists_path
    end

    private 

    def list_params 
        params.require(:list).permit(:user_id, :name, :category_id, :description, category_attributes: [
            :name
        ])
    end

end
