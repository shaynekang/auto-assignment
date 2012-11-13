# Auto::Assignment

Auto assign model resource and collection from controller

## Installation

Add this line to your application's Gemfile:

    gem 'auto-assignment'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install auto-assignment

## Usage
### Before
```ruby
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.save!
    redirect_to @post, notice: 'Post was successfully created.'
  rescue ActiveRecord::RecordInvalid
    render 'new'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes!(params[:post])
    redirect_to @post, notice: 'Post was successfully updated.'
  rescue ActiveRecord::RecordInvalid
    render 'edit'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end
end
```

### After
```ruby
class PostsController < ApplicationController
  # declare this. then,
  auto_assignment

  def create
    @post.save!
    redirect_to @post, notice: 'Post was successfully created.'
  rescue ActiveRecord::RecordInvalid
    render 'new'
  end

  def update
    @post.save!
    redirect_to @post, notice: 'Post was successfully updated.'
  rescue ActiveRecord::RecordInvalid
    render 'edit'
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end
end
```

## TODO
### Version 0.0.3
  * auto_assignment :model, :parent => '#{model_name}' option
  * auto_assignment :model, :as => '#{model_name}' option
  * decouple rails from test
  * test rails compatibility

### NOT YET
  * scoped
  * performance check

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
