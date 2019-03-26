class SeenAnimalsController < ApplicationController
  #  GET /animals
  def index
    @seen_animals = SeenAnimal.all
    render json: @seen_animals
  end

  # GET /animals/1
  def show
    @seen_animal = SeenAnimal.find(params[:id])

    render json: @seen_animal
  end

  # POST /animals
  def create
    @seen_animal = SeenAnimal.new(animal_params)

    if @seen_animal.save
      render json: @seen_animal, status: :created, location: @seen_animal
    else
      render json: @seen_animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  # def update
  #   @seen_animal = SeenAnimal.find(params[:id])

  #   if @seen_animal.update(animal_params)
  #     render json: @seen_animal
  #   else
  #     render json: @seen_animal.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /animals/1
  # def destroy
  #   @seen_animal = SeenAnimal.find(params[:id])
  #   @seen_animal.destroy

  #   private

  # # Only allow a trusted parameter "white list" through
  # def animal_params
  #   params.require(:seen_animal).permit(:species, :count_of_time_seen, :locations_of_last_seen)
  # end
end
