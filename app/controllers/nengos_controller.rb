class NengosController < ApplicationController
  def index
    flash[:success] = "平成27ですよ！ありがとう！"
  end

  def index_with_flash
    flash[:success] = "平成27ですよ！ありがとう！"
    render :index
  end
end
