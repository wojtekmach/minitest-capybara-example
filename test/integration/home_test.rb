require "test_helper"
require "capybara/rails"

class AcceptanceSpec < Minitest::Spec
  include Capybara::DSL
  include Capybara::Assertions
end

class HomeTest < AcceptanceSpec
  it "home test" do
    visit "/"

    assert_content "Homepage"
    page.must_have_content "Homepage"

    within ".login" do
      refute_content "Signed in as"
      page.wont_have_content "Signed in as"
    end

    assert_link "Sign in"
    assert_link find(".login"), "Sign in"
    find(".login").must_have_link("Sign in")

    assert_selector 'li:first', text: "Item 1"
    page.must_have_selector 'li:first', text: "Item 1"
  end
end
