module Refinery
  module Htcs
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Htcs

      engine_name :refinery_htcs

      initializer "register refinerycms_work_hours plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "work_hours"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.htcs_admin_work_hours_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/htcs/work_hour'
          }
          plugin.menu_match = %r{refinery/htcs/work_hours(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::WorkHours)
      end
    end
  end
end
