feature 'contact us page' do
  scenario 'it loads home page' do
    visit ('/')
    expect(page.current_path).to eq('/')
  end

  scenario 'user can see content on the home page' do
    visit ('/')
    expect(page).to have_content 'QAWorks have been acquired by ECS Digital'
  end
end
