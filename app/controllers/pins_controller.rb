class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :repost, :like]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to pins_path, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url, notice: 'Pin was successfully destroyed.'
  end

  def repost
    @pin.repost(current_user)
    redirect_to pins_path
  end

  def like
    @like = @pin.likes.build(user_id: current_user.id)
    if @like.save
      flash[:notice] = "You liked this pin!"
      redirect_to pins_path
    else
      flash[:notice] = "You already liked this pin!"
      redirect_to pins_path
    end
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description, :pin_image, :board_id)
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end
end
