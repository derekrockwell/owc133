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
Refinery::Menus::Menu.create(title: "grief_sidebar", permatitle: "grief_sidebar")
Refinery::Menus::Menu.create(title: "career_openings", permatitle: "career_openings")

puts "create base custom pages and their parts"
(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  %w(what why when volunteer).each do |slug|
    if Refinery::Page.where(:slug => slug).empty?
      # 2013-03-15 - DECj: this is .upcase not .uppercase
      page = Refinery::Page.create(
        :title => slug.upcase,
        :deletable => false,
        :view_template => slug
      )
      Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
        page.parts.create(:title => default_page_part, :body => nil, :position => index)
      end
    end
  end
end

if !Refinery::Page.exists?(:slug => "footer")
  page = Refinery::Page.create(:title => "footer", :deletable => false)

  %w(section1 section2 section3).each do |section|
    page.parts.create(:title => section)

  end
end

#clean up the homepage parts
Refinery::Page.where(:link_url => "/").first.parts.each do |part|
  part.delete if (part.title == "Body" || part.title == "Side Body")
end

#create homepage parts
@page = Refinery::Page.where(:link_url => "/").first
parts = %w[slide1 slide2 slide3 what why when left_story right_story]

parts.each do |part|
  @page.parts.create(:title => part) unless @page.parts.collect(&:title).include? part
end

# Added by Refinery CMS Htcs extension
Refinery::Htcs::Engine.load_seed
#this should probably be extracted to the htcs gem, but it is pretty
#tied to the HOTC app yet (not good)
@page = ::Refinery::Page.where(:slug => 'volunteer-information').first
@page.link_url = "/htcs/volunteers/new"
@page.save
