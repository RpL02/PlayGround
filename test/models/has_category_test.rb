require "test_helper"

describe HasCategory do
  let(:has_category) { HasCategory.new }

  it "must be valid" do
    value(has_category).must_be :valid?
  end
end
