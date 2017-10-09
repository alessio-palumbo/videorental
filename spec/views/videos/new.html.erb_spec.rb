require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :name => "MyString",
      :genre => "MyString",
      :year_released => 1,
      :classification => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input[name=?]", "video[name]"

      assert_select "input[name=?]", "video[genre]"

      assert_select "input[name=?]", "video[year_released]"

      assert_select "input[name=?]", "video[classification]"

      assert_select "input[name=?]", "video[description]"
    end
  end
end
