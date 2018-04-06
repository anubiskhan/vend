require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the snacks of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: 'Garbage', price: 1)
    snack2 = dons.snacks.create(name: 'Basura', price: 2)

    visit machine_path(dons)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content("Price: #{snack1.price}")
    expect(page).to have_content(snack2.name)
    expect(page).to have_content("Price: #{snack1.price}")
  end

  scenario 'they see the average price of snacks in that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: 'Garbage', price: 1)
    dons.snacks.create(name: 'Basura', price: 2)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: 1.5")
  end
end
