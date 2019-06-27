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
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to @performance, notice: 'Review was successfully created.' }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'performance/show' }
        format.js  # <-- idem
      end
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
    params.require(:review).permit(:rating, :description)
  end
end
