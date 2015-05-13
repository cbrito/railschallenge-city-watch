class EmergenciesController < ActionController::Base
  before_action :set_emergency, only: [:show, :edit, :update, :destroy]

  # GET /emergencies
  # GET /emergencies.json
  def index
    @emergencies = Emergency.all

    @full_response_count = 0  #TODO Set this to some value in index test based on Emergency.full_response

  end

  # GET /emergencies/1
  # GET /emergencies/1.json
  def show
    if @emergency.nil?
      render nothing: true, status: :not_found
    end

      @emergency

  end

  # POST /emergencies
  # POST /emergencies.json
  def create

    if params[:emergency][:id]
      render json: {message: "found unpermitted parameter: id"}, status: :unprocessable_entity
      return
    elsif params[:emergency][:resolved_at]
      render json: {message: "found unpermitted parameter: resolved_at"}, status: :unprocessable_entity
      return
    end

    @emergency = Emergency.new(emergency_params)

    respond_to do |format|
      if @emergency.save
        EmergenciesHelper.dispatch_responders @emergency
        format.json { render :show, status: :created, location: @emergency }
      else
        format.json { render json: {message: @emergency.errors}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergencies/1
  # PATCH/PUT /emergencies/1.json
  def update

    if emergency_params[:code]
      render json: {message: "found unpermitted parameter: code"}, status: :unprocessible_entity
      return
    end

    respond_to do |format|
      if @emergency.update(emergency_params)
        format.html { redirect_to @emergency, notice: 'Emergency was successfully updated.' }
        format.json { render :show, status: :ok, location: @emergency }
      else
        format.html { render :edit }
        format.json { render json: {message: @emergency.errors}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergencies/1
  # DELETE /emergencies/1.json
  def destroy
    @emergency.destroy
    respond_to do |format|
      format.html { redirect_to emergencies_url, notice: 'Emergency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency
      @emergency = Emergency.find_by(code: params[:code])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_params
      params.require(:emergency).permit(:code, :police_severity, :fire_severity, :medical_severity, :resolved_at)
    end
end
