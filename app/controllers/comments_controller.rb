class CommentsController < ApplicationController
  before_action :set_message
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @message.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to message_path(@message)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to message_path(@message)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
      redirect_to message_path(@message)
  end

  private

  def set_message
    @message = Message.find(params[:message_id])
  end

  def set_comment
    @comment = @message.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
