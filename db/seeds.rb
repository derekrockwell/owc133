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
Refinery::Page.create(title: "What", show_in_menu: true, view_template: "what")
Refinery::Page.create(title: "Why", show_in_menu: true, view_template:"why")
Refinery::Page.create(title: "When", show_in_menu: true, view_template: "when")
Refinery::Page.create(title: "volunteer", show_in_menu: true, view_template:"volunteer")
Refinery::Page.create(title: "volunteer_information", show_in_menu: true, view_template:"volunteer_information")
Refinery::Page.create(title: "volunteer_thank_you", show_in_menu: true, view_template:"volunteer_thank_you") #sub of volunteer_information /thanks


# Added by Refinery CMS Htcs extension
Refinery::Htcs::Engine.load_seed
