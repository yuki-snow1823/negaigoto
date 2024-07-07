class WishesController < ApplicationController
  def index
    @wishes = Wish.all
  end

  def create

  end

  def show
    @wish = Wish.find(params[:id])
  end

  private

  def wish_params

  end
end
