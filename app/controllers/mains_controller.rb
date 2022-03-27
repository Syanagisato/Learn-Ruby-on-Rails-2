class MainsController < ApplicationController
  before_action :set_main, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /mains or /mains.json
  def index
    if params[:title_key]
      @mains = Main.joins(:title).where(user_id: current_user.id).where('name LIKE ?', "%#{params[:title_key]}%")
    elsif params[:sakusya_key]
      @mains = Main.joins(:sakusya).where(user_id: current_user.id).where('name LIKE ?', "%#{params[:sakusya_key]}%")
    else
      @mains = Main.where(user_id: current_user.id)
    end
  end

  # GET /mains/1 or /mains/1.json
  def show
    @main = Main.find_by(id: params[:id])
  end

  # GET /mains/new
  def new
    @main = Main.new
  end

  # GET /mains/1/edit
  def edit
  end

  # POST /mains or /mains.json
  def create
    @main = Main.new(main_params)
    @main.user_id = current_user.id

    respond_to do |format|
      if @main.save
        format.html { redirect_to main_url(@main), notice: "新しい購入情報が登録されました！" }
        format.json { render :show, status: :created, location: @main }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mains/1 or /mains/1.json
  def update
    respond_to do |format|
      if @main.update(main_params)
        format.html { redirect_to main_url(@main), notice: "購入情報をアップデートしました！" }
        format.json { render :show, status: :ok, location: @main }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mains/1 or /mains/1.json
  def destroy
    @main.destroy

    respond_to do |format|
      format.html { redirect_to mains_url, notice: "購入情報を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main
      @main = Main.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_params
      params.require(:main).permit(:title_id, :number, :sakusya_id, :date, :publisher_id).merge(user_id: current_user.id)
    end
end
