class ClassifiedListingDecorator < ApplicationDecorator
  DEFAULT_COLOR = "".freeze

  def social_preview_description
    category = object.classified_listing_category
    category.social_preview_description || category.name
  end

  def social_preview_color(brightness:)
    color = object.social_preview_color || DEFAULT_COLOR
    HexComparer.new([color]).brightness(brightness)
  end
end
