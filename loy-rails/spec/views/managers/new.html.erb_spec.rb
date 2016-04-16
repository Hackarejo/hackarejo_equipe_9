require 'rails_helper'

RSpec.describe "managers/new", type: :view do
  before(:each) do
    assign(:manager, Manager.new(
      :name => "MyString",
      :shop => nil
    ))
  end

  it "renders new manager form" do
    render

    assert_select "form[action=?][method=?]", managers_path, "post" do

      assert_select "input#manager_name[name=?]", "manager[name]"

      assert_select "input#manager_shop_id[name=?]", "manager[shop_id]"
    end
  end
end
