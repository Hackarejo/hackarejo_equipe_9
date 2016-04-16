require 'rails_helper'

RSpec.describe "shops/edit", type: :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      :name => "MyString",
      :cnpj => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :info => "MyText",
      :company_name => "MyString"
    ))
  end

  it "renders the edit shop form" do
    render

    assert_select "form[action=?][method=?]", shop_path(@shop), "post" do

      assert_select "input#shop_name[name=?]", "shop[name]"

      assert_select "input#shop_cnpj[name=?]", "shop[cnpj]"

      assert_select "input#shop_address[name=?]", "shop[address]"

      assert_select "input#shop_phone[name=?]", "shop[phone]"

      assert_select "input#shop_email[name=?]", "shop[email]"

      assert_select "textarea#shop_info[name=?]", "shop[info]"

      assert_select "input#shop_company_name[name=?]", "shop[company_name]"
    end
  end
end
