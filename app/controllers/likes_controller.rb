class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    @post = @like.post
    if @like.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path, notice: "Liked!"}
      end
    else  
      format.html { redirect_to root_path, alert: "You have already liked this post!"}
    end
    
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @post = @like.post
    @like.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path, notice: "Unliked!"}
    end
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
