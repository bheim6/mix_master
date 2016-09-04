require 'rails_helper'

RSpec.describe Song, type: :model do
  context "validations" do
      it { is_expected.to validate_presence_of(:title) }
      # it { is_expected to_validate_uniqueness_of(:title) }
    end
end
