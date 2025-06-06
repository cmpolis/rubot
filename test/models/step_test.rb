require "test_helper"

class StepTest < ActiveSupport::TestCase
  test "must belong to a run" do
    step = Step.new
    assert_not step.valid?
    assert_includes step.errors[:run], "must exist"
  end

  test "must be unique by run and sequence" do
    existing_step = steps(:one)  # Assuming you have a fixture
    new_step = Step.new(
      run: existing_step.run,
      sequence: existing_step.sequence
    )
    
    assert_not new_step.valid?
    assert_includes new_step.errors[:sequence], "has already been taken"
  end
end