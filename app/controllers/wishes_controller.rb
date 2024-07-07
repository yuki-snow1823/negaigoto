# frozen_string_literal: true

class WishesController < ApplicationController
  def index
    @wishes = Wish.all
  end

  def new
    @wish = Wish.new
  end

  def create
    if @wish.save!
      redirect_to controller: :wish, action: :show
    else
      redirect_to :back
    end
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def edit
    @wish = Wish.find(params[:id])
  end

  def update
    @wish = Wish.find(params[:id])
    if @wish.update(wish_params)
      flash[:notice] = "願いごとを更新しました"
      redirect_to wish_path(@wish)
    else
      render :edit
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:user_name, :content)
  end
end
