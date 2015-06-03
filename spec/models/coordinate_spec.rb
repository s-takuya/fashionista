require 'rails_helper'

RSpec.describe Coordinate do
  it { is_expected.to respond_to(:person_name) }
  it { is_expected.to respond_to(:season) }
  it { is_expected.to respond_to(:occupation) }
end
