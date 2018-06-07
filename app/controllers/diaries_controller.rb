class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :set_categories
  before_action :set_users

  # GET /diaries
  # GET /diaries.json
  def index
    @diaries = Diary.all
  end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries
  # POST /diaries.json
  def create
    # modal用
    @diaries = Diary.all
    @diary = current_user.diaries.build(diary_params)
    @diary.save

    ### Original code
    # @diary = current_user.diaries.build(diary_params)
    # respond_to do |format|
    #   if @diary.save
    #     format.html { redirect_to @diary, notice: 'Diary was successfully created.' }
    #     format.json { render :show, status: :created, location: @diary }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @diary.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  def update
    #modal用
    @diaries = Diary.all
    @diary.update(diary_params)
    ### Original code
    # respond_to do |format|
    #   if @diary.update(diary_params)
    #     format.html { redirect_to @diary, notice: 'Diary was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @diary }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @diary.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  def destroy
    @diary.destroy
    respond_to do |format|
      format.html { redirect_to diaries_url, notice: 'Diary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def set_users
      @users = User.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_params
      params.require(:diary).permit(:title, :body, :category_id)
    end
end
