require 'rails_helper'

RSpec.describe Recipe, type: :model do

	context "validation: " do
		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to validate_presence_of(:cooktime) }
		it { is_expected.to validate_presence_of(:ingredients) }
		it { is_expected.to validate_presence_of(:tags) }
	end

end