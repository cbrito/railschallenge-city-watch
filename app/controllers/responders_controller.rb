class RespondersController < ActionController::Base
  before_action :set_responder, only: [:show, :edit, :update, :destroy]

  # GET /responders
  # GET /responders.json
  def index
    @responders = Responder.all
  end

  # GET /responders/1
  # GET /responders/1.json
  def show
    if @responder.nil?
      render nothing: true, status: :not_found
    end

      @responder

  end

  # GET /responders/new
  def new
    @responder = Responder.new
  end

  # GET /responders/1/edit
  def edit
  end

  # POST /responders
  # POST /responders.json
  def create

    if params[:responder][:id]
      render json: {message: "found unpermitted parameter: id"}, status: :unprocessable_entity
      return
    elsif params[:responder][:on_duty]
      render json: {message: "found unpermitted parameter: on_duty"}, status: :unprocessable_entity
      return
    elsif params[:responder][:emergency_code]
      render json: {message: "found unpermitted parameter: emergency_code"}, status: :unprocessable_entity
      return
    end


    @responder = Responder.new(responder_params)

    respond_to do |format|
      if @responder.save
        format.json { render :show, status: :created }
      else
        format.json { render json: {message:@responder.errors} , status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responders/1
  # PATCH/PUT /responders/1.json
  def update
    if params[:responder][:id]
      render json: {message: "found unpermitted parameter: id"}, status: :unprocessable_entity
      return
    elsif params[:responder][:emergency_code]
      render json: {message: "found unpermitted parameter: emergency_code"}, status: :unprocessable_entity
      return
    elsif params[:responder][:type]
      render json: {message: "found unpermitted parameter: type"}, status: :unprocessable_entity
      return
    elsif params[:responder][:name]
      render json: {message: "found unpermitted parameter: name"}, status: :unprocessable_entity
      return
    elsif params[:responder][:capacity]
      render json: {message: "found unpermitted parameter: capacity"}, status: :unprocessable_entity
      return
    end

    respond_to do |format|
      if @responder.update(responder_params)
        format.json { render :show, status: :ok }
      else
          format.json { render json: {message: @responder.errors}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responders/1
  # DELETE /responders/1.json
  def destroy
    @responder.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responder
      @responder = Responder.find_by(name: params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responder_params
      params.require(:responder).permit(:name, :type, :capacity, :on_duty)
    end
end
