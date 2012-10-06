require 'spec_helper'

describe AutoAssignment do
  let!(:new_post) { Post.new(title: "new post") }
  let!(:exist_post) { Post.new(title: "exist post") }

  before do
    Post.stub(:new) { new_post }
    Post.stub(:find) { exist_post }
  end

  it "should assign new resource without id" do
    controller = PostsController.new
    controller.auto_assignment('post', {})
    controller.post.should == new_post
  end

  it "should assign exist resource with id" do
    controller = PostsController.new
    controller.params = {id: 1}
    controller.auto_assignment('post', {})
    controller.post.should == exist_post
  end

  it "should assign resource's attributes" do
    controller = PostsController.new
    controller.params = {post: {description: "Hello World"}}
    controller.auto_assignment('post', {})
    controller.post.description.should == "Hello World"
  end
end