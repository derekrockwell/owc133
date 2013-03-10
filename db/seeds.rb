# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed

# Added by Refinery CMS Search engine
Refinery::Search::Engine.load_seed

# Added by Refinery CMS Venues extension
Refinery::Calendar::Engine.load_seed

# Added by Refinery CMS Page Menus extension
Refinery::Menus::Engine.load_seed


puts "loading custom menus, pages, etc"

puts "ensuring default custom menu"
Refinery::Menus::Menu.create(title: "header", permatitle: "header")
Refinery::Menus::Menu.create(title: "why_sidebar", permatitle: "why_sidebar")
Refinery::Menus::Menu.create(title: "what_sidebar", permatitle: "what_sidebar")
Refinery::Menus::Menu.create(title: "when_sidebar", permatitle: "when_sidebar")
Refinery::Menus::Menu.create(title: "volunteer_sidebar", permatitle: "volunteer_sidebar")

puts "create base custom pages and their parts"
(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  %w(What Why When Volunteer).each do |page|
    url = "/#{page.downcase.gsub(' ','_')}"
    if Refinery::Page.where(:link_url => url).empty?
      page = Refinery::Page.create(
        :title => page,
        :deletable => false,
        :view_template => page.downcase,
        :menu_match => "^#{url}(\/|\/.+?|)$"
      )
      Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
        page.parts.create(:title => default_page_part, :body => nil, :position => index)
      end
    end
  end
end
# Added by Refinery CMS Htcs extension
Refinery::Htcs::Engine.load_seed
