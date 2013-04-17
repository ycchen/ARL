class InventoryRecordsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :isAdmin?
  # GET /inventory_records
  # GET /inventory_records.json
  def index
    if params[:user_id]
      @inventory_records = current_user.inventory_records.order("created_at desc")
    elsif params[:search]
      @inventory_records = InventoryRecord.search(params[:search])
    else
      @inventory_records = InventoryRecord.order("created_at desc")
    end
    
    
    # print @inventory_records.map(&:location_id)
    @location_json = Location.where("id in (?)", @inventory_records.map(&:location_id)).to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventory_records }
    end
  end

  # GET /inventory_records/1
  # GET /inventory_records/1.json
  def show
    @inventory_record = InventoryRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory_record }
    end
  end

  # GET /inventory_records/new
  # GET /inventory_records/new.json
  def new
    @inventory_record = InventoryRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inventory_record }
    end
  end

  # GET /inventory_records/1/edit
  def edit
    @inventory_record = InventoryRecord.find(params[:id])
  end

  # POST /inventory_records
  # POST /inventory_records.json
  def create
    # raise params[:inventory_record].inspect
    @inventory_records =[] 
    success = true

    # params[:inventory_record][:inventory_id].each do |id|
    #   @inventory_records << id
    # end
    # raise @inventory_records.inspect

    params[:inventory_record][:inventory_id].each do |id|
      ir = InventoryRecord.new
      ir.user_id = params[:inventory_record][:user_id].to_i
      ir.inventory_id = id.to_i
      ir.inventory_status_id = params[:inventory_record][:inventory_status_id].to_i
      ir.location_id = params[:inventory_record][:location_id].to_i
      @inventory_records << ir
      success &&= ir.save
    end
    # @inventory_record = InventoryRecord.new(params[:inventory_record])

    respond_to do |format|
      if success
        format.html { redirect_to inventory_records_path , notice: 'Inventory record was successfully created.' }
        # format.json { render json: new_inventory_record_path, status: :created, location: @inventory_record }
      else
        format.html { render action: "new" }
        # format.json { render json: @inventory_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inventory_records/1
  # PUT /inventory_records/1.json
  def update
    @inventory_record = InventoryRecord.find(params[:id])

    respond_to do |format|
      if @inventory_record.update_attributes(params[:inventory_record])
        format.html { redirect_to @inventory_record, notice: 'Inventory record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_records/1
  # DELETE /inventory_records/1.json
  def destroy
    @inventory_record = InventoryRecord.find(params[:id])
    @inventory_record.destroy

    respond_to do |format|
      format.html { redirect_to inventory_records_url }
      format.json { head :no_content }
    end
  end
end
