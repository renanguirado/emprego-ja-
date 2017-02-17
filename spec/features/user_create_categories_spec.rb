require 'rails_helper'

feature 'User create categories' do
  scenario 'successfully' do
    category = Category.new(name: 'Estágio')

    visit new_category_path

    fill_in 'Nome',      with: category.name

    click_on 'Criar Categoria'

    expect(page).to have_css('h1', text: category.name)

  end

feature 'User update categories' do
  scenario 'successfully' do
    category = Category.create(name: "DBA")
    another_category = Category.create(name: "Designer")

    visit edit_category_path(category)

    fill_in 'Nome',       with: 'Dev'

    click_on "Atualizar Categoria"

    expect(page).to have_content 'Dev'
    expect(page).to have_content 'Designer'

    end

  end

end
