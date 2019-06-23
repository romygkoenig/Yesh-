class PerformancesController < ApplicationController
  before_action :set_performance, only: [:show]

  def index
    @performances = Performance.all
  end

  def show
  end

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)
    @performance.user = current_user
    if @performance.save
      redirect_to performance_path(@performance)
    else

      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_performance
    @performance = Performance.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(:name, :description, :price, :category, :city)
  end
end
