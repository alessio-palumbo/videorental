require 'rails_helper'

RSpec.describe "videos/show", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :name => "Name",
      :genre => "Genre",
      :year_released => 2,
      :classification => "Classification",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Genre/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Classification/)
    expect(rendered).to match(/Description/)
  end
end
