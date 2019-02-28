class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    # Best way to understand where each piece of this code is
    # coming from is to uncomment the raise in the following
    # line and check the params by yourself in the browser.

    # raise # <--- be always ready to use this

    @plant = Plant.find(params[:plant_id])
    tag_id = params[:plant_tag][:tag_id]
    @plant_tag = PlantTag.new(plant: @plant, tag_id: tag_id)
    if @plant_tag.save
      redirect_to garden_path(@plant.garden)
    else
      render :new
    end
  end
end
