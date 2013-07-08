require 'spec_helper'

describe Post do
  #Generates a method whose return value is memoized after the first call.
  let(:post) { Post.new }

  describe "should respond to" do
    #prefix # for instance method
    it "#get_title" do
      post.should respond_to(:get_title)
    end

    #prefix . for class method
    it ".find_published_post" do
      post.class.should respond_to(:find_published_post)
    end
  end
end
