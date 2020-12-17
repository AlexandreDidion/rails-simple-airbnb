class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    find_flat
  end

  def new
    @flat = Flat.new
  end

  def search
    @flats = Flat.where("name LIKE ?", '%params[]%')
  end

  def create
    @flat = Flat.new(flat_strong_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    find_flat
  end

  def update
    find_flat
    @flat.update(flat_strong_params)
    @flat.save
    redirect_to flat_path(@flat)
  end

  def destroy
    find_flat
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_strong_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end

  def find_flat
    @flat = Flat.find_by(id: params[:id])
  end
end
