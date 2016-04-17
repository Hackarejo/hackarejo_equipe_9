require 'rails_helper'

RSpec.describe Shop, type: :model do
  subject { shop }

  describe "#create" do
    let(:shop) { build(:shop) }

    it { is_expected.to be_valid }
  end
end
