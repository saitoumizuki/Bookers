class ReviewsController < ApplicationController
  def index
  end

  def new
      @reviews = Review.all
      @review = Review.new
  end

  def create
      review = Review.new(review_params)
      if review.save
        flash[:notice] = 'Book was successfully created.'
        redirect_to review_path(review)
        # 詳細ページへリダイレクト
      else
        @reviews = Review.all
        @review = Review.new
        @title = review.title
        @body = review.body
        render :new
      end
  end

  def show
      @review = Review.find(params[:id])
  end

  def edit
      @review = Review.find(params[:id])
  end
  def update
      review = Review.find(params[:id])
      review.update(review_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to review_path(review)
      # 詳細ページへリダイレクト
  end
  def destroy
      review = Review.find(params[:id])
      review.destroy
      flash[:notice] = 'Book was successfully destroyed.'
      redirect_to new_review_path
      # 一覧兼投稿ページへリダイレクト
  end

  private
  def review_params
      params.require(:review).permit(:title, :body)
  end
end