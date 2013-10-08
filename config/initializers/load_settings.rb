SETTINGS = YAML.load_file("#{Rails.root}/config/settings.yml")[Rails.env]
ALLOW_LOCALE = Dir["#{Rails.root}/config/locales/*.yml"].map {|f| File.basename(f).split('.').first}
