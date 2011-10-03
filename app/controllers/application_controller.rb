class Blog

  get '/' do
    @posts = Post.all
    haml :'posts/index'
  end

end