module Refinery
  module Htcs
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Htcs

      engine_name :refinery_htcs

      initializer "register refinerycms_volunteer_categories plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "volunteer_categories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.htcs_admin_volunteer_categories_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/htcs/volunteer_category',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/htcs/volunteer_categories(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::VolunteerCategories)
      end
    end
  end
end
