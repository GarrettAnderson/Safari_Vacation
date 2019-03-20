class SeenAnimalsController < ApplicationController
  #  GET /animals
  def index
    @animals = SeenAnimal.ApplicationController
    render json: @animals
  end

  # GET /animals/1
  def show
    @animal = SeenAnimal.find(params[:id])

    render json: @animal
  end

  # POST /animals
  def create
    @animal = SeenAnimal.new(animal_params)

    if @animal.save
      render json: @animal, status: :created, location: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  def update
    @animal = SeenAnimal.find(params[:id])

    if @animal.update(animal_params)
      render json: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  def destroy
    @animal = SeenAnimal.find(params[:id])
    @animal.destroy

    private

  # Only allow a trusted parameter "white list" through
  def animal_params
    params.require(:seen_animal).permit(:species, :count_of_time_seen, :locations_of_last_seen)
  end
end
