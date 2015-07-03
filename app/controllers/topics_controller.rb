class TopicsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.order(updated_at: :desc).page(params[:page]).per(8)
    @topic = Topic.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    @topic.user = current_user

    if @topic.save
      flash[:notice] = "新增文章成功！"
      redirect_to topics_path
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @page_title = @topic.title
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = "修改文章成功！"
      redirect_to topics_path
    else
      render :edit
    end
  end


  def destroy
    @topic.destroy
    flash[:aleart] = "你已經刪除你的文章！"
    redirect_to :back
  end

  private

    def topic_params
      params.require(:topic).permit(:title, :article, :category_id, :select_ids => [])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

end


