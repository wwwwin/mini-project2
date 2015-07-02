class TopicsController < ApplicationController

before_action :

  def index

  end

  def new

  end

  def show

  end

  def create

  end

  def edit

  end

  def update

  end


  def destroy

  end

  private

  def topic_params

    params.require(:topics)

  end


end
