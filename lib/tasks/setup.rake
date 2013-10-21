# -*- coding: utf-8 -*-
namespace :mides_api do
  namespace :development do
    desc "Configura la aplicacion para un ambiente de desarrollo"
    task :setup  do      

      STDOUT.puts "¿Esta seguro de continuar? (y/n)"
      input = STDIN.gets.strip
      if input == 'y'
        project_root = File.expand_path(Dir.pwd)

        db_config = (project_root + '/config/database.yml')
        if File.exists?(db_config)
          FileUtils.remove_file(db_config)
        end
        
        db_sqlite_config = (project_root + '/config/database.yml.sqlite.example')
        puts db_sqlite_config

        FileUtils.cp(db_sqlite_config, db_config)

        Rake::Task["db:setup"].invoke
      end
    end
  end

  namespace :staging do
    desc "Configura la aplicacion para un ambiente de staging en Heroku"
    task :setup do      
      STDOUT.puts "¿Esta seguro de continuar? (y/n)"
      input = STDIN.gets.strip
      if input == 'y'
        project_root = File.expand_path(Dir.pwd)

        db_config = (project_root + '/config/database.yml')
        if File.exists?(db_config)
          FileUtils.remove_file(db_config)
        end
        
        db_new_config = (project_root + '/config/database.yml.pg.example')
        puts db_new_config

        FileUtils.cp(db_new_config, db_config)
      end
    end

  end

end
