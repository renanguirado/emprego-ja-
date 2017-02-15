require 'rails_helper'

feature 'User edit jobs' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    job = Job.create(title: 'Vaga de Dev',
                     category: 'Desenvolvedor',
                     company: company,
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo')

    visit edit_job_path(job)

    fill_in 'Título',       with: 'Dev Android'
    fill_in 'Local',        with: 'Belo Horizonte'
    fill_in 'Categoria',    with: 'Desenvolvedor Mobile'
    fill_in 'Descrição',    with: 'Desenvolvedor de apps integradas via API'

    click_on 'Atualizar Vaga'

    expect(page).to have_css('h1', text: 'Dev Android')
    expect(page).to have_content 'Belo Horizonte'
    expect(page).to have_content 'Desenvolvedor Mobile'
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Desenvolvedor de apps integradas via API'
  end

  scenario 'and change company' do

    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    job = Job.create(title: 'Vaga de Dev',
                     category: 'Desenvolvedor',
                     company: company,
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo')

    google = Company.create(name: 'Google',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476')


    visit edit_job_path(job)

    select google.name, from: 'Empresa'

    click_on 'Atualizar Vaga'

    expect(page).to have_css('h1', text: job.title)
    expect(page).to have_content 'Google'
  end

  scenario 'with valid data' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    job = Job.create(title: 'Vaga de Dev',
                     category: 'Desenvolvedor',
                     company: company,
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo')

    visit edit_job_path(job)

    fill_in 'Título', with: ''

    click_on 'Atualizar Vaga'

    expect(page).to have_content 'Não foi possível atualizar a vaga'
  end
end
