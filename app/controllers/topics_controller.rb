class TopicsController < ApplicationController

before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.order(create_at: :desc).page(params[:page]).per(8)
    @topic = Topic.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "新增文章成功！"
      redirect_to topic_path
    else
      render :new
  end

  def show
    @topic = Topic.find(params[:id])
    @page_title = @topic.title
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic = Topic.update(topic_params)
      flash[:notice] = "修改文章成功！"
      redirect_to topic_path
    else
      render :edit
  end


  def destroy
    @topic.destroy
    flash[:aleart] = "你已經刪除你的文章！"
    redirect_to :index
  end

  private

  def topic_params

    params.require(:topics).permit(:title, :article)

  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
