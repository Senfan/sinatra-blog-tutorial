class Blog
  
  # New Post Page
  get '/posts/new' do
    @post = Post.new
    haml :'posts/new'
  end

  # Create Post
  post '/posts' do
    @post = Post.new(params[:post])

    if @post.save
      redirect '/'
    else
      haml :'posts/new'
    end
  end

  # List Posts
  get '/posts' do
    @posts = Post.all
    haml :'posts/index'
  end

  # Show Post
  get '/posts/:id' do |id|
    @post = Post.get(id)
    haml :'posts/show'
  end

  # Edit Post
  get '/posts/:id/edit' do |id|
    @post = Post.get(id)
    haml :'posts/edit'
  end

  # Update Post
  put '/posts/:id' do |id|
    @post = Post.get(id)

    if @post.update(params[:post])
      redirect "/posts/#{@post.id}"
    else
      haml :'posts/edit'
    end
  end

  # Delete
  get '/posts/:id/delete' do |id|
    @post = Post.get(id)
    haml :'posts/delete'
  end

  # Destroy
  delete '/posts/:id' do |id|
    Post.get(id).destroy
    redirect '/'
  end

end