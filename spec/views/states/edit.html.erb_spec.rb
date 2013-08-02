require 'spec_helper'

describe "states/edit" do
  before(:each) do
    @state = assign(:state, stub_model(State,
      :spread => 1,
      :establ => 1,
      :build => 1,
      :happy => 1,
      :time => 1,
      :transformers => 1
    ))
  end

  it "renders the edit state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", state_path(@state), "post" do
      assert_select "input#state_spread[name=?]", "state[spread]"
      assert_select "input#state_establ[name=?]", "state[establ]"
      assert_select "input#state_build[name=?]", "state[build]"
      assert_select "input#state_happy[name=?]", "state[happy]"
      assert_select "input#state_time[name=?]", "state[time]"
      assert_select "input#state_transformers[name=?]", "state[transformers]"
    end
  end
end
