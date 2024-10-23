Given('I have declared my name as {string}') do |name|
    @name = name
    visit('/?name=' + name)
end



Then('I will be greeted by name') do
    expect(page).to have_content(@name)
    found_greeting = greetings.any? { |greeting| page.has_content?(greeting, wait: 0.2) }
    expect(found_greeting).to be(true), "None of the greetings were found on the page"
end

  