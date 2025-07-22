class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable, only: :create
  def create
     like = @likeable.likes.build(user: current_user)
    # @like = current_user.likes.create(likeable_id: params[:likeable_id], likeable_type: params[:likeable_type])
    #  debugger
    respond_to do |format|
      if like.save
        format.turbo_stream
        # { render turbo_stream: turbo_stream.replace("likes_post#{@likeable.id}"), partial: "likes/like_button", locals: { likeable: @likeable}}
        # format.html { redirect_back fallback_location: root_path, notice: "Liked!"}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@likeable, "likes"), partial: "likes/like_button", locals: { likeable: @likeable})}
      end
    end
  end

  def destroy
    like = Like.find(params[:id])
    @likeable = like.likeable
    like.destroy

    respond_to do |format|
      format.turbo_stream
      # format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@likeable,"likes"), partial: "like/like_button", locals: { likeable: likeable})}
      format.html { redirect_back fallback_location: root_path, notice: "Unliked"}
    end

  end

  private
  # def find_likeable
  #   params[:likeable_type].constantize.find(params[:likeable_id])
  # end
  def set_likeable
    kclass = params[:likeable_type].constantize rescue nil
    @likeable = kclass.find_by(id: params[:likeable_id]) if kclass
  end
end
