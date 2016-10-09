class CommentsController < ApplicationController
	before_action :set_comment, only: [:edit, :destroy]
    def create
        @status = Status.find(params[:status_id])
        @comment.user_id= current_user.id
        @comment = @status.comments.create(comment_params)
        redirect_to new_status_path
    end

    def destroy
        @status = Status.find(params[:status_id])
        @comment = @status.comments.find(params[:id])
        @comment.destroy
        respond_to do |format|
            format.html { redirect_to new_status_path }
            format.json { head :no_content }
        end
    end

    private
    def set_comment
        @comment=Comment.find(params[:id])
    end
    def comment_params
      	params.require(:comment).permit(:user_id, :body)
    end
end
