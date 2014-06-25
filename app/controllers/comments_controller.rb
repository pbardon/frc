class CommentsController < ApplicationController
  
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
    render json: @comments
  end
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @commentable = find_commentable
    @comment = @commentable.comments(params[:id])
    @comment.destroy!
    
    render json: @comment
  end
  
  
  def update
    @commentable = find_commentable
    @comment = @commentable.comments.update_attributes(params[:comment])
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    @commentable = find_commentable
    @comment = @commentable.comments(params[:id])
    render json: @comment
  end
  
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
end
