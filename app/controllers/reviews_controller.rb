class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_performance, only: [:new, :create]

  def index
    @reviews = policy_scope(Review)
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.performance = @performance
    if @review.save
      redirect_to @performance, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @performance, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to @performance, notice: "Review was successfully deleted."
  end

  private

  def set_review
    @review = Review.find(params[:performance_id])
    authorize @review
  end

  def set_performance
    @performance = Performance.find(params[:performance_id])
    authorize @performance
  end

  def review_params
    params.require(:review).permit(:rating)
  end
end
