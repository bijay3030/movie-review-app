# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Movie, type: :model) do
  subject do
    described_class.new(name: 'The Shawshank Redemption',
                        genre: ['Drama'],
                        length_in_minutes: '144',
                        release_date: '1994-02-23T00:00:00.213Z',
                        directors: ['Frank Darabont'],
                        actors: ['Tim Robbins', 'Morgan Freeman'],
                        writers: ['Stephen King', 'Frank Darabont'],
                        summary: 'Chronicles the experiences of a formerly successful banker as a prisoner in the gloomy
                                   jailhouse of Shawshank after being found guilty of a crime he did not commit.',
                        producers: ['Castle Rock Entertainment']
                       )
  end

  describe 'validation' do
    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_uniqueness_of(:name)) }
    it { is_expected.to(validate_presence_of(:genre)) }
    it { is_expected.to(validate_presence_of(:length_in_minutes)) }
    it { is_expected.to(validate_presence_of(:release_date)) }
    it { is_expected.to(validate_presence_of(:directors)) }
    it { is_expected.to(validate_presence_of(:actors)) }
    it { is_expected.to(validate_presence_of(:writers)) }
    it { is_expected.to(validate_presence_of(:summary)) }
    it { is_expected.to(validate_presence_of(:producers)) }
    it { is_expected.to(be_valid) }
  end
end
