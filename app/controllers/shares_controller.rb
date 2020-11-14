class SharesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @shares = Share.all
  end
    
  def show
    @share = Share.find(params[:id])
  end
    
  def new
    @share = current_user.shares.build
  end
    
  def create
    @share = current_user.share.build(share_params)
    
    if @share.save
      redirect_to share_path(@share), notice: '投稿できました'
    else
      flash.now[:error] = '投稿できませんでした'
      render :new
    end
  end
  
  def edit
    @share = current_user.share.find(params[:id])
  end
  
  def update
    @share = current_user.share.find(params[:id])

    if @share.update(share_params)
      redirect_to share_path(@share), notice: '更新しました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    @share = current_user.share.find(params[:id])
    @share.destroy

    flash[:success] = '正常に削除されました'
    redirect_to shares_url
  end
  
  private
   
  def share_params
    params.require(:share).permit(:title, :content, :place)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
    
end    

