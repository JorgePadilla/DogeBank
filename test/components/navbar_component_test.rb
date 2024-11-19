# frozen_string_literal: true

require "test_helper"

class NavbarComponentTest < ViewComponent::TestCase
  def test_component_renders_navbar
    # Render the component
    rendered_component = render_inline(NavbarComponent.new)

    # Assert that the navbar contains the expected elements
    assert_includes rendered_component.css("nav").to_html, "DogeBank"
    assert_includes rendered_component.css("a").to_html, "Buy Dogecoin"
    # assert_includes rendered_component.css("a").to_html, "Pricing"
    # assert_includes rendered_component.css("a").to_html, "About"
  end
end
