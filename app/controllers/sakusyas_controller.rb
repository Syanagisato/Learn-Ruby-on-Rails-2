class SakusyasController < ApplicationController
  before_action :set_sakusya, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /sakusyas or /sakusyas.json
  def index
    @sakusyas = Sakusya.where(user_id: current_user.id)
  end

  # GET /sakusyas/1 or /sakusyas/1.json
  def show
    @main = Sakusya.find_by(id: params[:id])
  end

  # GET /sakusyas/new
  def new
    @sakusya = Sakusya.new
  end

  # GET /sakusyas/1/edit
  def edit
  end

  # POST /sakusyas or /sakusyas.json
  def create
    @sakusya = Sakusya.new(sakusya_params)
    @sakusya.user_id = current_user.id

    respond_to do |format|
      if @sakusya.save
        format.html { redirect_to sakusya_url(@sakusya), notice: "新しい作者を登録しました！" }
        format.json { render :show, status: :created, location: @sakusya }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sakusya.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sakusyas/1 or /sakusyas/1.json
  def update
    respond_to do |format|
      if @sakusya.update(sakusya_params)
        format.html { redirect_to sakusya_url(@sakusya), notice: "作者情報をアップデートしました！" }
        format.json { render :show, status: :ok, location: @sakusya }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sakusya.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sakusyas/1 or /sakusyas/1.json
  def destroy
    @sakusya.destroy

    respond_to do |format|
      format.html { redirect_to sakusyas_url, notice: "作者情報を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sakusya
      @sakusya = Sakusya.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sakusya_params
      params.require(:sakusya).permit(:name).merge(user_id: current_user.id)
    end
end
