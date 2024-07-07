# frozen_string_literal: true

class WishesController < ApplicationController
  def index
    @wishes = Wish.all
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    if @wish.save!
      flash[:wish_success_message] = '願いごとが作られました'
      redirect_to wish_path(@wish)
    else
      flash[:wish_success_faild] = '願いごとが作られませんでした'
      redirect_to :back
    end
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def destroy
    @wish = Wish.find(params[:id])
    if @wish.destroy
      redirect_to wishes_path
    else
      flash[:danger] = '削除に失敗しました'
      render :show
    end
  end

  def count_up_likes
    @wish = Wish.find(params[:id])
    @wish.likes_count += 1
    @wish.save
    redirect_to wish_path(@wish)
  end

  private

  def wish_params
    params.require(:wish).permit(:user_name, :content)
  end
end
