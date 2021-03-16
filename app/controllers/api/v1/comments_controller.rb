class Api::V1::CommentsController < ApplicationController

    
    
    
    def index()
        byebug
        comments = Comment.all
        render json: CommentSerializer.new(comments)
    end

    def create
        state = State.find_by(name: params[:statename].upcase)
        comment = state.comments.new(comment_params)
        if comment.save
            render json: CommentSerializer.new(comment), status: :accepted
        else
            render json: {errors: comment.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def get_states 
        state = State.find_by(name: params[:name].upcase)
        comments = state.comments
        render json: comments
    end

        

    private

    def comment_params
        params.require(:comment).permit(:context)
    end



end