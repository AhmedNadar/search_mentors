class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :authorized_user,     only:   [:edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    # @profile = Profile.new
    @profile = current_user.profiles.build
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = current_user.profile.build(profile_params)

    # if user_signed_in?
    #   @profile.user_id = current_user.id
    # end

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
      # @profile = params[:id] == @profile ? @profile : Profile.find(params[:id])
      # if user_signed_in?
      #   @profile = current_user.profile
      # end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:summery, :city, :country, :gender, :first_name, :last_name, :company, :user_id , :avatar ,{skill_ids: [], job_ids: [], industry_ids: []} )
    end

   def authorized_user
      unless @profile.user_id == current_user.id
        redirect_to root_path, notice: "Not authorized for this action!"
      end
    end
end