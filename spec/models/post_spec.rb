require 'spec_helper'

describe Post do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    #it { belong_to(:user) }
  end

  #Generates a method whose return value is memoized after the first call.
  let(:new_post) { Post.new }
  let(:unpublished_post) { FactoryGirl.create :post }
  let(:published_post) { create :published_post } # short form, just write create method

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
      it { should include(published_post.title) }
      it { should include('(P)') }
    end

    context "when not publish" do
      subject { unpublished_post.get_title() }
      it { should eq(unpublished_post.title) }
    end
  end

  describe ".find_published_post(id)" do
    context "given id is nil" do
      it { expect { Post.find_published_post(nil) }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    describe "given id is not nil" do
      describe "when post existed" do
        context "and not publish" do
          it { expect { Post.find_published_post(unpublished_post.id) }.to raise_error(ActiveRecord::RecordNotFound) }
        end

        context "and publish" do
          subject { Post.find_published_post(published_post.id) }
          it { should be_an_instance_of(Post) }
          its(:id) { should eql(published_post.id) }
        end
      end

      context "when post not existed" do
        # currently, database is empty, with any id, say 10000
        before { @id = 10000 }
        it { expect { Post.find_published_post(@id) }.to raise_error(ActiveRecord::RecordNotFound) }
      end
    end
  end
end

