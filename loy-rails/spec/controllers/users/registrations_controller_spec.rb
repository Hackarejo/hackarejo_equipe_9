require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  let(:user) { User.last }
  let(:sign_up_params) {{
    name: "New User Name",
    email: "newemail@test.com",
    password: "abc123456",
    password_confirmation: "abc123456",
    userable: userable
  }}

  before {
    request.env["devise.mapping"] = Devise.mappings[:user]
  }

  describe "POST create" do
    subject { post :create, user: sign_up_params }

    describe "as Client" do
      let(:userable) { "client" }

      context "with valid params" do
        it { expect { subject }.to change(User, :count).by(1) }
        it { expect { subject }.to change(Client, :count).by(1) }
      end
    end

    describe "as Manager" do
      let(:userable) { "manager" }

      context "with valid params" do
        it { expect { subject }.to change(User, :count).by(1) }
        it { expect { subject }.to change(Manager, :count).by(1) }
        it { expect { subject }.to change(Shop, :count).by(1) }
      end
    end

  end
end
