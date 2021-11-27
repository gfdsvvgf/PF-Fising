class Customer::PostCommentsController < ApplicationController
  def create
    @list = List.find(params[:todolist_id])
    @comment = PostComment.new
    @comment = PostComment.create(post_comment_params)
    @comment.save
  end


  def destroy
    @list = List.find(params[:todolist_id])
    @comment = current_customer.post_comments.find(params[:id])
    @comment.destroy
  end





  private

  def post_comment_params
    params.require(:post_comment).permit(:comment).merge(customer_id: current_customer.id, list_id: params[:todolist_id])
  end

end
