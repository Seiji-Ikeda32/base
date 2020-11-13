class SharesController < ApplicationController
  def index
    @shares = Share.all
  end
    
  def show
    @share = Share.find(params[:id])
  end
    
  def new
    @share = Share.new
  end
    
  def create
   　 @share = Share.new(share_params)

    if @share.save
      flash[:success] = '投稿されました'
      redirect_to @share
    else
      flash.now[:danger] = '投稿できませんでした'
      render :new
    end
  end
  
  def edit
    @share = Share.find(params[:id])
  end
  
  def update
    @share = Share.find(params[:id])

    if @share.update(share_params)
      flash[:success] = '正常に更新されました'
      redirect_to @share
    else
      flash.now[:danger] = '更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    @share = Share.find(params[:id])
    @share.destroy

    flash[:success] = '正常に削除されました'
    redirect_to shares_url
  end
  
  private
   
  def share_params
    params.require(:share).permit(:title, :content, :place)
  end
    
end    

