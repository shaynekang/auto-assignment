require 'spec_helper'

describe AutoAssignment do
  let!(:new_model) { Model.new(title: "new model") }
  let!(:exist_model) { Model.new(title: "exist model") }

  before do
    Model.stub(:new) { new_model }
    Model.stub(:find) { exist_model }
  end

  it "should assign new resource without id" do
    controller = ModelsController.new
    controller.auto_assignment('model', {})
    controller.model.should == new_model
  end

  it "should assign exist resource with id" do
    controller = ModelsController.new
    controller.params = {id: 1}
    controller.auto_assignment('model', {})
    controller.model.should == exist_model
  end

  it "should assign resource's attributes" do
    controller = ModelsController.new
    controller.params = {model: {description: "Hello World"}}
    controller.auto_assignment('model', {})
    controller.model.description.should == "Hello World"
  end
end