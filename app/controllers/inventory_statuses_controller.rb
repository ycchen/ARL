class InventoryStatusesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :isAdmin?
  # GET /inventory_statuses
  # GET /inventory_statuses.json
  def index
    @inventory_statuses = InventoryStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventory_statuses }
    end
  end

  # GET /inventory_statuses/1
  # GET /inventory_statuses/1.json
  def show
    @inventory_status = InventoryStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory_status }
    end
  end

  # GET /inventory_statuses/new
  # GET /inventory_statuses/new.json
  def new
    @inventory_status = InventoryStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inventory_status }
    end
  end

  # GET /inventory_statuses/1/edit
  def edit
    @inventory_status = InventoryStatus.find(params[:id])
  end

  # POST /inventory_statuses
  # POST /inventory_statuses.json
  def create
    @inventory_status = InventoryStatus.new(params[:inventory_status])

    respond_to do |format|
      if @inventory_status.save
        format.html { redirect_to @inventory_status, notice: 'Inventory status was successfully created.' }
        format.json { render json: @inventory_status, status: :created, location: @inventory_status }
      else
        format.html { render action: "new" }
        format.json { render json: @inventory_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inventory_statuses/1
  # PUT /inventory_statuses/1.json
  def update
    @inventory_status = InventoryStatus.find(params[:id])

    respond_to do |format|
      if @inventory_status.update_attributes(params[:inventory_status])
        format.html { redirect_to @inventory_status, notice: 'Inventory status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_statuses/1
  # DELETE /inventory_statuses/1.json
  def destroy
    @inventory_status = InventoryStatus.find(params[:id])
    @inventory_status.destroy

    respond_to do |format|
      format.html { redirect_to inventory_statuses_url }
      format.json { head :no_content }
    end
  end
end
