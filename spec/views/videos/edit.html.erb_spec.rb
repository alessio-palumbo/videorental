require 'rails_helper'

RSpec.describe "videos/edit", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :name => "MyString",
      :genre => "MyString",
      :year_released => 1,
      :classification => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", video_path(@video), "post" do

      assert_select "input[name=?]", "video[name]"

      assert_select "input[name=?]", "video[genre]"

      assert_select "input[name=?]", "video[year_released]"

      assert_select "input[name=?]", "video[classification]"

      assert_select "input[name=?]", "video[description]"
    end
  end
end
