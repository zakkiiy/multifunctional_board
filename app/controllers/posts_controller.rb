class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new  # コメントの新規インスタンスを生成
    @comments = @post.comments.includes(:user).order(created_at: :desc)  # 投稿に関連するコメントを取得
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to posts_path, notice: '投稿が完了しました。'
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    
    if @post.update(post_params)
      redirect_to posts_path, notice: '編集が完了しました。'
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_path, success: '削除しました。', status: :see_other
  end

  def bookmarks
    @bookmarks_boards = current_user.bookmark_boads.includes(:user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :start_date, :end_date, :recruiting_count, :status)
  end
end
