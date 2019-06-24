class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_performance, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query]
      @performances = policy_scope(Performance).where(category: params[:query])
    else
      @performances = policy_scope(Performance)
    end
  end

  def show
  end

  def new
    @performance = Performance.new
    authorize @performance
  end

  def create
    @performance = Performance.new(performance_params)
    @performance.user = current_user
    authorize @performance
    if @performance.save
      redirect_to performance_path(@performance)
    else

      render :new
    end
  end

  def edit
  end

  def update
    if @performance.update(performance_params)
      redirect_to @performance, notice: 'Performance was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @performance.destroy
    redirect_to performances_path, notice: 'Restaurant was successfully destroyed.'
  end

  private

  def set_performance
    @performance = Performance.find(params[:id])
    authorize @performance
  end

  def performance_params
    params.require(:performance).permit(:name, :description, :price, :category, :city, :photo)
  end
end
