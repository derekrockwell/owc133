module Refinery
  module VolunteerCategories
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::VolunteerCategories

      engine_name :refinery_htcs

      initializer "register refinerycms_volunteer_categories plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "volunteer_categories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.volunteer_categories_admin_volunteer_categories_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/volunteer_categories/volunteer_category',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::VolunteerCategories)
      end
    end
  end
end
