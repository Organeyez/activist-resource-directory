class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @resource = Resource.find(params[:review][:resource_id])
    @review = @resource.reviews.new(review_params)
    if @review.save
      redirect_to resource_path(@resource), notice: "Your review was successfully created"
    else
      @errors = @review.errors.full_messages
      redirect_to resource_path(@resource), notice: "Unable to save your review"
    end
  end

  def edit
    @review = Review.find(params[:id])
    @resource = Resource.find(@review.resource_id)
    respond_to do |f|
       f.html { render :edit}
       f.json { render json: @review.to_json }
       f.js
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update_attributes(review_params)
    @resource = Resource.find(@review.resource_id)

    if @review.save
      redirect_to resource_path(@resource), notice: "Your review was successfully updated"
    else
      @errors = @review.errors.full_messages
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to request.referer, notice: "Resource was successfully destroyed"
  end

  private

  def review_params
    params.require(:review).permit(:message, :evidence_rating, :useful_rating, :detail_rating, :recommend_rating, :author_id, :resource_id)
  end
end
