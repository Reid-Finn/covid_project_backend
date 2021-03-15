class Api::V1::CommentsController < ApplicationController

    
    
    
    def index
       
        comments = Comment.all
        render json: CommentSerializer.new(comments)
    end

    def create(statename)
        state = State.Find_by(name: statename)
        byebug
        comment = state.comment.new(comment_params)
        if comment.save
            render json: CommentSerializer.new(comment), status: :accepted
        else
            render json: {errors: comment.errors.full_messages}, status: :unprocessible_entity
        end
    end

        

    private

    def comment_params
        params.require(:comment).permit(:context)
    end



end