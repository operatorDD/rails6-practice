Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w[staffs.css]
Rails.application.config.assets.precompile += %w[customers.css]
Rails.application.config.assets.precompile += %w[admins.css]
