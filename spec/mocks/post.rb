class Post
  attr_accessor :title, :description

  def self.scoped
    self
  end

  def initialize(params)
    attributes = params
  end

  def attributes=(params)
    @title = params[:title]
    @description = params[:description]
  end
end