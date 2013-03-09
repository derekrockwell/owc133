(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-htcs').blank?
        user.plugins.create(:name => 'refinerycms-htcs',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/htcs"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Htcs',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end
(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-htcs').blank?
        user.plugins.create(:name => 'refinerycms-htcs',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/htcs/volunteer_categories"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Volunteer Categories',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end
(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-htcs').blank?
        user.plugins.create(:name => 'refinerycms-htcs',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/htcs/work_hours"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Work Hours',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end
(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-htcs').blank?
        user.plugins.create(:name => 'refinerycms-htcs',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/htcs/volunteers"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Volunteers',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end

VolunteerCategory.find_or_create_by_name("Patient and Family Care")
VolunteerCategory.find_or_create_by_name("Bereavement")
VolunteerCategory.find_or_create_by_name("Administrative Support")
VolunteerCategory.find_or_create_by_name("Needlework")
VolunteerCategory.find_or_create_by_name("Vigil")
VolunteerCategory.find_or_create_by_name("Pet Therapy")
VolunteerCategory.find_or_create_by_name("Speakers Bereau")
VolunteerCategory.find_or_create_by_name("Massage Therapy")
VolunteerCategory.find_or_create_by_name("Holiday Lights and Limos")
