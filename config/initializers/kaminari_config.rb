Kaminari.configure do |config|
  config.default_per_page = 8
  config.window = 2
  config.outer_window = 4
  config.left = 1
  config.right = 2
  # config.param_name = :page
end
