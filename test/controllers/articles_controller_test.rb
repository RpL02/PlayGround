require "test_helper"

describe ArticlesController do
  it "should get index" do
    get :index
    value(response).must_be :success?
  end

  it "should get new" do
    get :new
    value(response).must_be :success?
  end

  it "should get show" do
    get :show
    value(response).must_be :success?
  end

  it "should get edit" do
    get :edit
    value(response).must_be :success?
  end

  it "should get update" do
    get :update
    value(response).must_be :success?
  end

end
