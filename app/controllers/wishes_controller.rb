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
      flush[:wish_success_message] = "願いごとが作られました"
      redirect_to controller: :wish, action: :show, id: @wish.id
    else
      flush[:wish_success_faild] = "願いごとが作られませんでした"
      redirect_to :back
    end
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def destroy
    if @wish.destroy
      redirect_to wishes_path
    else
      render :show, danger: "削除に失敗しました"
    end
  end

  private

  def set_wish
    @wish = Wish.find(params[:id])
  end

  def wish_params
    params.requrie(:wish).permit(:user_name, :content)
  end
end
