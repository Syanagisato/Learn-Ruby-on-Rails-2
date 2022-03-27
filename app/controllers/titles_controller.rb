class TitlesController < ApplicationController
  before_action :set_title, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /titles or /titles.json
  def index
    @titles = Title.where(user_id: current_user.id)
  end

  # GET /titles/1 or /titles/1.json
  def show
    @title = Title.find_by(id: params[:id])
  end

  # GET /titles/new
  def new
    @title = Title.new
  end

  # GET /titles/1/edit
  def edit
  end

  # POST /titles or /titles.json
  def create
    @title = Title.new(title_params)
    @title.user_id = current_user.id

    respond_to do |format|
      if @title.save
        format.html { redirect_to title_url(@title), notice: "新しいタイトルを登録しました！" }
        format.json { render :show, status: :created, location: @title }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titles/1 or /titles/1.json
  def update
    respond_to do |format|
      if @title.update(title_params)
        format.html { redirect_to title_url(@title), notice: "タイトル情報をアップデートしました！" }
        format.json { render :show, status: :ok, location: @title }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titles/1 or /titles/1.json
  def destroy
    @title.destroy

    respond_to do |format|
      format.html { redirect_to titles_url, notice: "タイトル情報を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_title
      @title = Title.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def title_params
      params.require(:title).permit(:name).merge(user_id: current_user.id)
    end
end
