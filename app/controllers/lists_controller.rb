class ListsController < ApplicationController
  before_action :find_list, only: %i[show edit update]
  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def create
    @list = List.create!(list_params)

    redirect_to list_path(@list)
  end

  def edit; end

  def update
    @list.update(list_params)

    redirect_to @list
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
