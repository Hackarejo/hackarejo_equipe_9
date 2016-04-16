require 'rails_helper'

RSpec.describe "managers/edit", type: :view do
  before(:each) do
    @manager = assign(:manager, Manager.create!(
      :name => "MyString",
      :shop => nil
    ))
  end

  it "renders the edit manager form" do
    render

    assert_select "form[action=?][method=?]", manager_path(@manager), "post" do

      assert_select "input#manager_name[name=?]", "manager[name]"

      assert_select "input#manager_shop_id[name=?]", "manager[shop_id]"
    end
  end
end
