class ListsController < ApplicationController
  before_action :find_list, only: %i[show edit update]
  def index
    @lists = List.all
  end

  def show
    @review = Review.new
    @review.list = @list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
