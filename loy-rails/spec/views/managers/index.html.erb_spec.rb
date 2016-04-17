require 'rails_helper'

RSpec.describe "managers/index", type: :view do
  before(:each) do
    assign(:managers, [
      Manager.create!(
        :name => "Name",
        :shop => nil
      ),
      Manager.create!(
        :name => "Name",
        :shop => nil
      )
    ])
  end

  it "renders a list of managers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
