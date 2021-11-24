class Customer::PostCommentsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @comment = PostComment.new
    @comment = PostComment.create(post_comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_back(fallback_location: root_path) } 
        format.js  
      else
        format.html { redirect_back(fallback_location: root_path) } 
      end
    end
  end
  
  
  def destroy
    @list = List.find(params[:list_id])
    @comment = current_customer.post_comments.find(params[:id])
    @comment.destroy
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment).merge(customer_id: current_customer.id, list_id: params[:list_id])
  end
  
end
