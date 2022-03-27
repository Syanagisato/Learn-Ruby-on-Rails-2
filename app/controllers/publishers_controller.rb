class PublishersController < ApplicationController
  before_action :set_publisher, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /publishers or /publishers.json
  def index
    @publishers = Publisher.where(user_id: current_user.id)
  end

  # GET /publishers/1 or /publishers/1.json
  def show
    @publisher = Publisher.find_by(id: params[:id])
  end

  # GET /publishers/new
  def new
    @publisher = Publisher.new
  end

  # GET /publishers/1/edit
  def edit
  end

  # POST /publishers or /publishers.json
  def create
    @publisher = Publisher.new(publisher_params)
    @publisher.user_id = current_user.id

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to publisher_url(@publisher), notice: "新しい出版社を登録しました！" }
        format.json { render :show, status: :created, location: @publisher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishers/1 or /publishers/1.json
  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to publisher_url(@publisher), notice: "出版社情報をアップデートしました！" }
        format.json { render :show, status: :ok, location: @publisher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishers/1 or /publishers/1.json
  def destroy
    @publisher.destroy

    respond_to do |format|
      format.html { redirect_to publishers_url, notice: "出版社情報を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publisher_params
      params.require(:publisher).permit(:name).merge(user_id: current_user.id)
    end
end
