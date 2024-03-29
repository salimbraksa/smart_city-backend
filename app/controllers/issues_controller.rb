class IssuesController < ApplicationController
  before_action :authenticate_user
  before_action :set_issue, only: [:dislike, :like, :show, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all.sort_by(&:score)
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    if @issue.save
      render :show, status: :created, location: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
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
  def like
      @issue.liked_by current_user
      render json: {success: true}, status: :ok
  end

  # GET /issues/:id/dislike
  def dislike
      @issue.disliked_by current_user
      render json: {success: true}, status: :ok
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
    def issue_params
      params.require(:issue).permit(:description)
    end

end
