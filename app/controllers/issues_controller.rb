class IssuesController < ApplicationController
  before_action :authenticate_user
  before_action :set_issue, only: [:unconfirm, :confirm, :show, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index

    city = params[:city]
    latitude = params[:latitude]
    longitude = params[:longitude]

    if city.present?
      @issues = Issue.all.where(city: city).sort_by(&:score)
    elsif latitude.present?
      @issues = Issue.near([latitude, longitude], 1)
    end

  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # POST /issues
  # POST /issues.json
  def create

    @item = IssueItem.new(issue_item_params)

    if !@item.issue.present?
      issue = Issue.new
      issue.city = params[:city]
      issue.latitude = params[:latitude]
      issue.longitude = params[:longitude]
      @item.issue = issue
    end
    
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    if @issue.update(issue_params)
      render :show, status: :ok, location: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # GET /issues/:id/like
  def confirm
      @issue.liked_by current_user
      render json: {success: true}, status: :ok
  end

  # GET /issues/:id/unlike
  def unconfirm
      @issue.unliked_by current_user
      render json: {success: true}, status: :ok
  end

  # GET /issues/around
  def around
    latitude = params[:latitude]
    longitude = params[:longitude]
    @issues = Issue.near([latitude, longitude], 1)
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_item_params
      params.require(:issue).permit(:description, :image, :issue_id)
    end

    def coordinate_params
      params.require(:coordinate).permit(:latitude, :longitude)
    end

end
