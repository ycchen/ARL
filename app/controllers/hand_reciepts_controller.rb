class HandRecieptsController < ApplicationController
  # GET /hand_reciepts
  # GET /hand_reciepts.json
  def index
    @hand_reciepts = HandReciept.includes(:user).order("updated_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hand_reciepts }
    end
  end

  # GET /hand_reciepts/1
  # GET /hand_reciepts/1.json
  def show
    @hand_reciept = HandReciept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hand_reciept }
    end
  end

  # GET /hand_reciepts/new
  # GET /hand_reciepts/new.json
  def new
    @hand_reciept = HandReciept.new
    @hand_reciept[:reciept]= HandReciept.unique_reciept
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hand_reciept }
    end
  end

  # GET /hand_reciepts/1/edit
  def edit
    @hand_reciept = HandReciept.find(params[:id])
  end

  # POST /hand_reciepts
  # POST /hand_reciepts.json
  def create    
    # params[:hand_reciept].merge(:reciept => HandReciept.unique_reciept)
    # raise params[:hand_reciept].inspect
    # @hand_reciept = HandReciept.new(params[:hand_reciept].merge(:reciept => HandReciept.unique_reciept))
    
    @hand_reciept = HandReciept.new(params[:hand_reciept])


    respond_to do |format|
      if @hand_reciept.save
        format.html { redirect_to @hand_reciept, notice: 'Hand reciept was successfully created.' }
        format.json { render json: @hand_reciept, status: :created, location: @hand_reciept }
      else
        format.html { render action: "new" }
        format.json { render json: @hand_reciept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hand_reciepts/1
  # PUT /hand_reciepts/1.json
  def update
    @hand_reciept = HandReciept.find(params[:id])

    respond_to do |format|
      if @hand_reciept.update_attributes(params[:hand_reciept])
        format.html { redirect_to @hand_reciept, notice: 'Hand reciept was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hand_reciept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hand_reciepts/1
  # DELETE /hand_reciepts/1.json
  def destroy
    @hand_reciept = HandReciept.find(params[:id])
    @hand_reciept.destroy

    respond_to do |format|
      format.html { redirect_to hand_reciepts_url }
      format.json { head :no_content }
    end
  end
end
