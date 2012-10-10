require 'spec_helper'

describe BlogController do

  # GET /blog -> BlogController#index
  describe "GET to index" do

    let!(:post1) { create(:post) }
    let!(:post2) { create(:post) }

    before { get :index }

    it "should assign entry to entries" do
      assigns(:posts).should == ([post2, post1])
    end

  end

  # GET /blog/:id -> BlogController#show
  describe "GET to show" do

    let!(:post) { create(:post) }

    before { get :show, :id => post.id }

    it "should assign entry to entry" do
      assigns(:post).should == post
    end

  end

  # GET /blog/edit/:id -> BlogController#edit
  describe "GET to edit" do

    let(:post) { create(:post) }

    before do
      get :edit, :id => post.id
    end

    it "should assign entry to entry" do
      assigns(:post).should == post
    end

  end

  # PUT /blog/:id -> BlogController#update
  describe 'PUT to update' do

    let!(:post) { create(:post) }
    before { put :update, id: post.id, post: {title:   'Test 123',
                                              content: 'Test Update Content'} }

    it { should redirect_to blog_path(post) }
    it { should set_the_flash.to("Blog Post updated") }

    it "should have a new title" do
      assigns(:post).title.should == "Test 123"
    end

    it "should have a new content" do
      assigns(:post).content.should == "Test Update Content"
    end
  end

  # GET /blog/new  -> BlogController#new
  describe 'GET to new' do

    before { get :new }

    it "should assign a new post" do
      assigns(:post).new_record? == true
    end

  end

  # POST /blog -> BlogController#create
  describe 'POST to create' do

    before { post :create, post: {title:   'Test Post',
                                  content: 'Test Post'}}

    it { should redirect_to blog_path(assigns(:post))}
    it { should set_the_flash.to('Blog Post created')}

    it "should create a new post with title 'Test Post'" do
      assigns(:post).title.should == "Test Post"
    end

    it "should create a new post with content 'Test Post'" do
      assigns(:post).content.should == "Test Post"
    end

  end

end
