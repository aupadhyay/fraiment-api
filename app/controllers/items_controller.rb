class ItemsController < ApplicationController
  before_action :authenticate_user
  
  # POST /items
  def create
    @item = Item.new(user_create_params)    
    if @item.save
      render json: @item, status: :created 
    else
      render :json => { :errors => @item.errors.full_messages }, :status => 422
    end
  end

  # POST /items/:id/images
  def upload_images
    @item = Item.find(params[:id])
    if params[:images]
      params[:images].each { |image|
        @item.images.create(image: image)
      }
    end
  end

  private

  def user_create_params
    params.require(:item).permit(:name, :description, :price)
  end
end
