class BeachesController < ApplicationController
  before_action :set_beach, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:  :index

  # GET /beaches
  def index
    @beaches = Beach.all
  end

  # GET /beaches/1
  def show
  end

  # GET /beaches/new
  def new
    @beach = Beach.new
  end

  # GET /beaches/1/edit
  def edit
  end

  # POST /beaches
  def create
    @beach = Beach.new(beach_params)
    @beach.user = current_user
    if @beach.save
      redirect_to @beach, notice: 'Beach was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @beach.update(beach_params)
      redirect_to @beach, notice: 'Beach was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1
  def destroy
    @beach.destroy
    redirect_to beaches_url, notice: 'Beach was successfully destroyed.'
  end

  private

  def set_beach
    @beach = Beach.find(params[:id])
  end

  def beach_params
    params.require(:beach).permit(:address, :title, :price, :description, :photo, :lunch)
  end
end
