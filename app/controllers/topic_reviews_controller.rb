class TopicReviewsController < ApplicationController

  before_action :set_topic

  def topic_reviews_count
    @topic = Topic.find( params[:topic_id] )
    @review = @topic.reviews.find( params[:id] )
    @count = @review.comment.count
  end

  def index
    @topic = Topic.find( params[:topic_id] )
    @reviews = @topic.reviews.order(created_at: :desc).page(params[:page]).per(8)
    @review = @topic.reviews.build
  end

  def show
    @topic = Topic.find( params[:topic_id] )
    @review = @topic.reviews.find( params[:id] )
  end

  def new
    @review = @topic.reviews.build
  end

  def create
    @review = @topic.reviews.build( review_params )
     @review.user = current_user
    if @review.save

      redirect_to topic_reviews_url( @topic )

    else
      render :action => :new
    end
  end

  def edit
    @review = @topic.reviews.find( params[:id] )
  end

  def update
    @review = @topic.reviews.find( params[:id] )

    if @review.update( review_params )
      redirect_to topic_attendees_url( @topic )
    else
      render :action => :edit
    end

  end

  def destroy
    @review = @topic.reviews.find( params[:id] )
    @review.destroy

    redirect_to topic_reviews_url( @topic )
  end

protected

  def set_topic
    @topic = Topic.find( params[:topic_id] )
  end

  def review_params
    params.require(:review).permit(:comment)
  end



end
