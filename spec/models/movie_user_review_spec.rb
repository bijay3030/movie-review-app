# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(MovieUserReview, type: :model) do
  subject do
    described_class.new(review: 'i had to give this movie a 10/10, and i only have 4 movies that iould rate that way in
                                  my life time.',
                        published_at: '06/04/2020 14:10:25',
                        rating: 5.5,
                        user_id: user,
                        movie_id: movie
                       )
  end

  describe 'validation' do
    it { is_expected.to(validate_presence_of(:review)) }
    it { is_expected.to(validate_presence_of(:published_at)) }
    it { is_expected.to(validate_presence_of(:rating)) }

    it 'checks rating validation' do
      subject.rating = 10.0
      expect(subject).to(be_valid)
    end

    describe 'validating all validations' do
      let!(:user) do
        User.create!(email: 'adil@gmail.com',
                     password: 'Adil12345!',
                     first_name: 'Adil',
                     last_name: 'Tuladhar',
                     role: 'audience'
                    )
      end
      let!(:movie) do
        Movie.create!(name: 'The Shawshank Redemption',
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

      it do
        expect(subject).to(be_valid)
      end
    end
  end
end
