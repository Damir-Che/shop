class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  # /items/1 GET
  def show
    @item = Item.find(params[:id])
  end
  #--------------------------------

  # /items/new GET
  def new
    #рендерит форму для заполнения и потом отправит в create
    @item = Item.new
  end
  # /items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item) #(@item) - /items/id
    else
      render 'items/new'
    end
  end
  #--------------------------------


  def edit # /items/1/edit GET
    #находит в БД запись с нужным id и отправляет заполненую форму в update
    @item = Item.find(params[:id])
  end

  def update # /items/1 PUT
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item) #(@item) - /items/id
    else
      render 'items/edit'
    end
  end
  #--------------------------------


  # /items/1 DELETE
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  #голосование
  def upvote
    @item = Item.find(params[:id])
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  #выводим самы дорогие товары
  def expensive
    @items = Item.where("price > 1000")
    render "index"
  end


  private

  def item_params
    params.require(:item).permit(:price,:name, :real, :wight, :description)
  end

end
