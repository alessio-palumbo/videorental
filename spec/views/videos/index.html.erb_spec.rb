require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :name => "Name",
        :genre => "Genre",
        :year_released => 2,
        :classification => "Classification",
        :description => "Description"
      ),
      Video.create!(
        :name => "Name",
        :genre => "Genre",
        :year_released => 2,
        :classification => "Classification",
        :description => "Description"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Classification".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
