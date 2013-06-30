require "test_helper"

require 'capybara/rails'
require 'minitest/capybara'

class AcceptanceTest < Minitest::Unit::TestCase
  include Capybara::DSL
  include Minitest::Capybara::Assertions

  def teardown
    Capybara.reset_session!
    Capybara.use_default_driver
  end
end

class AcceptanceSpec < AcceptanceTest
  extend Minitest::Spec::DSL
end

class HomeTest < AcceptanceSpec
  it "home test" do
    visit "/"

    assert_content "Homepage"
    page.must_have_content "Homepage"

    within ".login" do
      assert_no_content "Signed in as"
      page.must_have_no_content "Signed in as"
    end

    assert_link "Sign in"
    assert_link find(".login"), "Sign in"
    find(".login").must_have_link("Sign in")

    assert_selector 'li:first', text: "Item 1"
    page.must_have_selector 'li:first', text: "Item 1"
  end
end
