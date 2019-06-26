class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_performance, only: [:show, :edit, :update, :destroy]

  def index
    if params[:city_query].present? && params[:category_all_query].present? && params[:price_all_query].present?
      @performances = policy_scope(Performance).search_by_city(params[:city_query])
      @performances = @performances.where('price<= ?', params[:price_all_query])
      return @performances if params[:category_all_query] == ["All"]
      @performances = @performances.where(category: params[:category_all_query])
    elsif params[:city_query].present? && params[:price_all_query].present?
      @performances = policy_scope(Performance).search_by_city(params[:city_query])
      @performances = @performances.where('price <= ?', params[:price_all_query])
    elsif params[:city_query].present? && params[:category_all_query].present?
      @performances = policy_scope(Performance).search_by_city(params[:city_query])
      return @performances if params[:category_all_query] == ["All"]
      @performances = @performances.where(category: params[:category_all_query])
    elsif params[:category_all_query].present? && params[:price_all_query].present?
      @performances = policy_scope(Performance).where('price<= ?', params[:price_all_query])
      return @performances if params[:category_all_query] == ["All"]
      @performances = @performances.where(category: params[:category_all_query])
    elsif params[:city_query].present?
      @performances = policy_scope(Performance).search_by_city(params[:city_query])
    elsif params[:category_all_query].present?
      return @performances = policy_scope(Performance) if params[:category_all_query] == ["All"]
      @performances = policy_scope(Performance).where(category: params[:category_all_query])
    elsif params[:price_all_query].present?
      @performances = policy_scope(Performance).where('price<= ?', params[:price_all_query])
    # elsif params[:city_query].present? && (params[:category_all_query].present? || params[:price_all_query].present?)
      # search_term = (params[:city_query] + ' ' + params[:category_all_query] + ' ' + params[:price_all_query]).to_a
      # @performances = policy_scope(Performance).search_by_city_price(search_term)

      # Performance.where('price< ?', params[:price_all_query])
      # search_term = "#{params[:city_query]} #{params[:price_all_query]}"
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
