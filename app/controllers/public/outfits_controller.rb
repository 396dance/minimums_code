class Public::OutfitsController < ApplicationController
  # userがログインしていないとページ見れない(topページAboutページのみ見れる)
  before_action :authenticate_user!, except: [:top, :about]


  def index
    @outfit = Outfit.new
    @users = User.all

    # タグ検索
    if params[:tag_id].present?
      @outfits = Tag.find(params[:tag_id]).outfits
      @tag_id = params[:tag_id]
    else
      @outfits =  Outfit.all
    end

    # データの並び替え(新しい順/古い順)
    if params[:latest]
      @outfits = @outfits.latest
    elsif params[:old]
      @outfits = @outfits.old
    end

    @outfits = @outfits.page(params[:page])
  end

  def edit
    @outfit = Outfit.find(params[:id])
    @user = @outfit.user
    if @user == current_user
      @outfits = Outfit.new
      @outfit_comment = OutfitComment.new
    else
      redirect_to outfits_path
    end
  end

  def update
    @outfit = Outfit.find(params[:id])
    if @outfit.update(outfit_params)
      redirect_to outfit_path(@outfit.id)
    else
      render :edit
    end
  end

  def create
    @outfits = Outfit.page(params[:page])
    @outfit = Outfit.new(outfit_params)
    @outfit.user_id = current_user.id
    if @outfit.save
      redirect_to outfit_path(@outfit.id)
    else
      render :index
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
    @user = @outfit.user
    @outfits = Outfit.new
    @outfit_comment = OutfitComment.new
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @user = @outfit.user
    @outfit.destroy
    redirect_to user_path(@user)
  end

  private
  def outfit_params
    params.require(:outfit).permit(:image, :title, :body, tag_ids: [])
  end

end
