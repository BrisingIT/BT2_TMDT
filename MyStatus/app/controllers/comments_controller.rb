class CommentsController < ApplicationController
	before_action :set_comment, only: [:edit, :destroy]
    before_action :authorize
    def create
        @status = Status.find(params[:status_id])
        @comment = @status.comments.new(comment_params)
        @comment.user_id= current_user.id
        @comment.save
        redirect_to "/"
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
      	params.require(:comment).permit(:body, :user_id, :status_id)
    end
end
