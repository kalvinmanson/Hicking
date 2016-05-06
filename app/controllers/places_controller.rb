class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy, :add_category, :add_attribute]
  before_filter :es_admin, only: [:new, :edit, :update, :destroy, :add_category, :add_attribute]


  #Agregar Categoria al lugar
  def add_category
    respond_to do |format|
      category = Category.find(params[:category_id])
      @place.categories << category 

      if @place.save

        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  #Agregar Atributo al lugar
  def add_attribute
      respond_to do |format|

      option = Option.find(params[:option_id])
      if current_user.id == @place.user_id
        activado = true
      else
        activado = false
      end

      @attribute = Attribute.new
      @attribute.place_id = @place.id
      @attribute.user_id = current_user.id
      @attribute.option_id = option.id
      @attribute.name = params[:valor]
      @attribute.active = activado

      if @attribute.save

        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  #Agregar Atributo al lugar
  def map
    slugvar = params[:id]
    @places = Category.friendly.find(slugvar).places.limit(100)
  end

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)

        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:user_id, :city_id, :name, :slug, :content, :active)
    end
end
