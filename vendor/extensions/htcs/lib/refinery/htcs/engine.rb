module Refinery
  module Htcs
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Htcs

      engine_name :refinery_htcs

      initializer "register refinerycms_htcs plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "htcs"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.htcs_admin_htcs_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/htcs/htc',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Htcs)
      end
    end
  end
end
