# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe(User, type: :model) do
  subject do
    described_class.new(email: 'adil@1gmail.com',
                        password: 'Adil12345!',
                        first_name: 'Adil',
                        last_name: 'Tuladhar',
                        role: 'audience'
                       )
  end

  describe 'validation' do
    it { is_expected.to(validate_presence_of(:password)) }
    it { is_expected.to(validate_presence_of(:first_name)) }
    it { is_expected.to(validate_presence_of(:last_name)) }
    it { is_expected.to(validate_presence_of(:role)) }
    it { is_expected.to(be_valid) }
  end
end
