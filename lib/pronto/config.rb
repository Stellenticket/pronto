module Pronto
  class Config
    DOTFILE = '.pronto.yml'

    def excluded_files
      @excluded_files ||= file['exclude'].flat_map { |path| Dir[path] }
    end

    private

    def file
      @file ||= if File.exists?(DOTFILE)
                  YAML.load_file(DOTFILE)
                else
                  nil_config_file
                end
    end

    def nil_file
      { 'exclude' => [] }
    end
  end
end
