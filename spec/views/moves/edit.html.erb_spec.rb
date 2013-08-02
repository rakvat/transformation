require 'spec_helper'

describe "moves/edit" do
  before(:each) do
    @move = assign(:move, stub_model(Move,
      :id => "MyString",
      :description => "MyString",
      :spread => 1,
      :establ => 1,
      :build => 1,
      :happy => 1,
      :time => 1,
      :transformers => 1
    ))
  end

  it "renders the edit move form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", move_path(@move), "post" do
      assert_select "input#move_id[name=?]", "move[id]"
      assert_select "input#move_description[name=?]", "move[description]"
      assert_select "input#move_spread[name=?]", "move[spread]"
      assert_select "input#move_establ[name=?]", "move[establ]"
      assert_select "input#move_build[name=?]", "move[build]"
      assert_select "input#move_happy[name=?]", "move[happy]"
      assert_select "input#move_time[name=?]", "move[time]"
      assert_select "input#move_transformers[name=?]", "move[transformers]"
    end
  end
end
