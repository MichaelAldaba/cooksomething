require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "chicken parm", summary: "this is the best chicken parm recipe ever", 
              description: "heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = nil
    assert_not @recipe.valid?
  end

  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name length should not be greater than 100 characters" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "name length should not be less than 5 characters" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = nil
    assert_not @recipe.valid?
  end

  test "summary length should not be greater than 150 characters" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end

  test "summary length should not be less than 10 characters" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end

  test "description must be present" do
    @recipe.description = nil
    assert_not @recipe.valid?
  end

  test "description should not be greater than 500 characters" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end

  test "description should not be less than 20 characters" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end

end