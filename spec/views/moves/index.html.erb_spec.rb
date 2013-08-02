require 'spec_helper'

describe "moves/index" do
  before(:each) do
    assign(:moves, [
      stub_model(Move,
        :code => "Code",
        :desc => "Desc",
        :spread => 1,
        :establ => 2,
        :build => 3,
        :happy => 4,
        :time => 5,
        :transformers => 6
      ),
      stub_model(Move,
        :code => "Code",
        :desc => "Desc",
        :spread => 1,
        :establ => 2,
        :build => 3,
        :happy => 4,
        :time => 5,
        :transformers => 6
      )
    ])
  end

  it "renders a list of moves" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
