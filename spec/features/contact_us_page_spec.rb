feature 'contact us page' do
  scenario 'it loads the page' do
    visit ('/')
    expect(page.current_path).to eq('/')
  end
end
