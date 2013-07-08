require 'spec_helper'

describe Post do
  #Generates a method whose return value is memoized after the first call.
  let(:new_post) { Post.new }
  let(:unpublished_post) { FactoryGirl.create :post }
  let(:published_post) { create :published_post } # short from, just write create method

  describe "should respond to" do
    #prefix # for instance method
    it "#get_title" do
      new_post.should respond_to(:get_title)
    end

    #prefix . for class method
    it ".find_published_post" do
      new_post.class.should respond_to(:find_published_post)
    end
  end

  describe "#get_title" do
    context "when publish" do
      subject { published_post.get_title() }
      it { should include('(P)') }
    end

    context "when not publish" do
      subject { unpublished_post.get_title() }
      it { should eq(unpublished_post.title) }
    end
  end
end
