class Public::OutfitsController < ApplicationController
  # userがログインしていないとページ見れない(topページAboutページのみ見れる)
  before_action :authenticate_user!, except: [:top, :about]

  def index
    @outfit = Outfit.new
    @users = User.all
    if params[:tag_id].present?
      @outfits = Tag.find(params[:tag_id]).outfits.page(params[:page])
    else
      @outfits =  Outfit.page(params[:page])
    end
  end

  def create
    @outfits = Outfit.all
    @outfit = Outfit.new(outfit_params)
    @outfit.user_id = current_user.id
    if @outfit.save
      redirect_to outfit_path(outfit.id)
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
