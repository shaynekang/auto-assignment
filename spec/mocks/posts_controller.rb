class PostsController < ActionController::Base
  auto_assignment

  attr_accessor :post, :posts
  attr_accessor :params

  def initialize
    @params = {}
  end
end