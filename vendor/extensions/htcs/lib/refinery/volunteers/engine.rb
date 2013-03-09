module Refinery
  module Htcs
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Htcs

      engine_name :refinery_htcs

      initializer "register refinerycms_volunteers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "volunteers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.htcs_admin_volunteers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/htcs/volunteer',
            :title => 'first_name'
          }
          plugin.menu_match = %r{refinery/htcs/volunteers(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Volunteers)
      end
    end
  end
end
