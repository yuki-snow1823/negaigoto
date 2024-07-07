# frozen_string_literal: true

class WishesController < ApplicationController
  before_action :set_wish, only: %i[show destroy count_up_likes]

  def index
    @wishes = Wish.all
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    if @wish.save
      flash[:wish_success_message] = '願いごとが作られました'
      redirect_to wish_path(@wish)
    else
      flash[:wish_success_faild] = '願いごとが作られませんでした'
      render :new
    end
  end

  def show; end

  def edit
    @wish = Wish.find(params[:id])
  end

  def update
    @wish = Wish.find(params[:id])
    if @wish.update(wish_params)
      flash[:notice] = '願いごとを更新しました'
      redirect_to wish_path(@wish)
    else
      render :edit
    end
  end

  def destroy
    if @wish.destroy
      redirect_to wishes_path, flash: { success: '削除しました' }, status: :see_other
    else
      flash[:danger] = '削除に失敗しました'
      render :show
    end
  end

  def count_up_likes
    @wish.likes_count += 1
    @wish.save
    redirect_to wish_path(@wish)
  end

  private

  def set_wish
    @wish = Wish.find(params[:id])
  end

  def wish_params
    params.require(:wish).permit(:user_name, :content)
  end
end
