class BottlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bottle, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @all_spirits = Bottle.pluck(:spirit).uniq
    @spirit = params[:spirit]

    @bottles = Bottle.all
    @bottles = @bottles.where(spirit: params[:spirit]) if params[:spirit]

    respond_with(@bottles)
  end

  def show
    respond_with(@bottle)
  end

  def new
    @bottle = Bottle.new
    respond_with(@bottle)
  end

  def edit
  end

  def create
    @bottle = Bottle.new(bottle_params)
    @bottle.save
    respond_with(@bottle)
  end

  def update
    @bottle.update(bottle_params)
    respond_with(@bottle)
  end

  def destroy
    @bottle.destroy
    respond_with(@bottle)
  end

  private
    def set_bottle
      @bottle = Bottle.find(params[:id])
    end

    def bottle_params
      params.require(:bottle).permit(:name, :type, :volume, :proof, :released, :price, :acquired_on, :open, :box, :notes, :score, :tradable, :sellable, :stocked, :open, :finished)
    end
end
