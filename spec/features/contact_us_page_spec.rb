feature 'contact us page' do
  scenario 'it loads home page' do
    visit ('/')
    expect(page.current_path).to eq('/')
  end

  scenario 'user can see content on the home page' do
    visit ('/')
    expect(page).to have_content 'QAWorks have been acquired by ECS Digital'
  end

  scenario 'user able to find a contact form' do
    go_to_contact_page
    expect(page).to have_content 'GET IN TOUCH'
  end

  scenario 'user able to fill in a contact form' do
    go_to_contact_page
    fill_in_form
    expect(page).to have_field('Name', with: 'j.Bloggs')
    expect(page).to have_field('Email', with: 'j.Bloggs@qaworks.com')
    expect(page).to have_field('Subject/Company/Project', with: 'test automation')
    expect(page).to have_field('How can we help you?', with: 'please contact me I want to find out more')
  end

  scenario 'user can submit a contact form' do
    go_to_contact_page
    fill_in_form
    click_button('send')
    sleep 5
    expect(page).to have_content 'THANK YOU FOR YOUR MESSAGE.'
  end

  scenario 'user can not leave empty fields' do
    go_to_contact_page
    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Subject/Company/Project', with: 'This is not a required field'
    fill_in 'How can we help you?', with: ''
    click_button('send')
    sleep 5
    within('form') do
        expect(page).to have_content('The field is required.', count: 3)
    end
    expect(page).to have_content 'PLEASE RE-SUBMIT WITH CORRECT INFORMATION'
  end
end
