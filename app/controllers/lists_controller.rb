class ListsController < ApplicationController
    before_action :require_permission, only: :show 

    def require_permission
        if current_user != List.find(params[:id]).user
            redirect_to lists_path
        end
        rescue ActiveRecord::RecordNotFound
        redirect_to root_url, :flash => { :error => "Record not found." }
    end


    def index 
        @user = current_user
        @lists = @user.lists.all
        @long_list = Item.long_items
    end

    def new
        @list = current_user.lists.build
    end

    def create 
        @list = current_user.lists.build(list_params)
        if @list.save
            redirect_to list_path(@list)
        else
            render 'new'
        end
    end

    def edit 
        @list = current_user.lists.find_by(id: params[:id])
    end

    def update 
        @list = current_user.lists.find_by(id: params[:id])
        if @list.update(list_params)
            redirect_to list_path(@list)
        else 
            render 'edit'
        end
    end

    def show 
        @list = current_user.lists.find_by_id(params[:id])
        @items = @list.items
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
