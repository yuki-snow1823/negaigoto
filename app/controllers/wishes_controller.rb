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
      flush
      redirect_to controller: :wish, action: :show, id: @wish.id
    else
      redirect_to :back
    end
  end

  def show
    @wish = Wish.find(params[:id])
  end

  private

  def wish_params
    params.requrie(:wish).permit(:user_name, :content)
  end
end
