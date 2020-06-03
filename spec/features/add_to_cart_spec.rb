require 'rails_helper'

RSpec.feature "User clicks Add to cart button for a product on the homepage and adds to their cart by 1", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Visit product details page" do
    # ACT
    visit root_path
    puts page.html
    click_button('Add', match: :first)
    


    # VERIFY
     expect(page).to have_content 'My Cart (1)'
    
    # DEBUG
    save_screenshot
  end
end
