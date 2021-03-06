require 'spec_helper'

describe "moves/show" do
  before(:each) do
    @move = assign(:move, stub_model(Move,
      :code => "Code",
      :desc => "Desc",
      :spread => 1,
      :establ => 2,
      :build => 3,
      :happy => 4,
      :time => 5,
      :transformers => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Desc/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
  end
end
