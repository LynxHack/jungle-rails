require 'rails_helper'

RSpec.feature "Visitor can navigate from home to product", type: :feature, js:true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User can click onto product detail page by clicking on product" do
    visit root_path
    find( '.details_button').click
    sleep(5)
    save_screenshot
  end
end
