class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :authorized_user,     only:   [:edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    @profiles = @profiles.first_name(params[:first_name]) if params[:first_name].present?
    # @profiles = @profiles.skills(params[:skills]) if params[:skills].present?
  end

  def show
  end

  def new
    # @profile = Profile.new
    @profile = current_user.profiles.build
  end

  def edit
  end
  def create
    @profile = current_user.profile.build(profile_params)
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
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:summery, :city, :country, :gender, :first_name, :last_name,
                                      :company, :user_id , :avatar ,
                                      {skill_ids: [], job_ids: [], industry_ids: []} )
    end

   def authorized_user
      unless @profile.user_id == current_user.id
        redirect_to root_path, notice: "Not authorized for this action!"
      end
    end
end