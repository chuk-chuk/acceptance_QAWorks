def fill_in_form
  fill_in 'Name', with: 'j.Bloggs'
  fill_in 'Email', with: 'j.Bloggs@qaworks.com'
  fill_in 'Subject/Company/Project', with: 'test automation'
  fill_in 'How can we help you?', with: 'please contact me I want to find out more'
end

def go_to_contact_page
  visit ('/')
  first('.fusion-main-menu').click_link('CONTACT US')
end
