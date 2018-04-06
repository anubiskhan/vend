require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the snacks of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    gregs  = owner.machines.create(location: "Greg's Mixed Snacks")
    snack = dons.snacks.create(name: 'Garbage', price: 11)
    MachineSnack.create(machine_id: gregs.id, snack_id: snack.id)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
    expect(page).to have_content(gregs.location)
    expect(page).to have_content(dons.location)
  end
end
