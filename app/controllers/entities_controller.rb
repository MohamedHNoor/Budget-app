class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /entities or /entities.json
  def index
    @entities = Entity.includes(:groups).where(user_id: current_user.id).order(created_at: :desc)
  end

  # GET /entities/1 or /entities/1.json
  def show; end

  # GET /entities/new
  def new
    @entity = Entity.new
    @categories = Group.where(user_id: current_user.id)
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    params = entity_params
    @entity = Entity.new(name: params[:name], amount: params[:amount])
    @entity.user_id = current_user.id
    @categories_ids = params[:group_ids]
    @categories_ids.each do |id|
      group = Group.find(id) unless id == ''
      @entity.groups.push(group) unless group.nil?
    end

    respond_to do |format|
      if @entity.save
        format.html { redirect_to groups_url(params[:group_id]), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to groups_url(params[:group_id]), notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end
