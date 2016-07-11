require 'spec_helper'

describe ReviewOptions do
  describe '.for_select' do
    it 'should be a nested array from 1..5' do
      expected_array = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
      test_array = ReviewOptions.for_select

      expect(test_array).to eq(expected_array)
    end
  end
end
