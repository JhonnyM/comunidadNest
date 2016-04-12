namespace :content do
  desc "Task to import content from sql"
  task import: :environment do
    left_categories = %w(blog eventos actividad curso-taller-charla concurso)
    dump_name = "nestadmi_joomnst.sql"
    file = Rails.root.join("lib").join(dump_name)
    sql = File.read(file)

    #Tuncate tables
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE industrias RESTART IDENTITY")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE profesiones RESTART IDENTITY")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE empresas RESTART IDENTITY")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE profesionales RESTART IDENTITY")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE blogs RESTART IDENTITY")

    statements = sql.split(/;$/)

    mal_categories = get_data_from_table(statements, 'mal_categories').map{|m| [m['id'], m['alias']]}.to_h
    mal_content = get_data_from_table(statements, 'mal_content')
    i = 0
    mal_content.each do |content|
      category = mal_categories[content['catid']]
      if category.in? left_categories
        blog = add_blog_entry(content, category)
        puts "#{i+=1} blog entries saved"
      end
    end

    mal_users = get_data_from_table(statements, 'mal_users')
    mal_users.each_with_index do |user, i|
      add_user(user)
      puts "#{i+=1}/#{mal_users.length} users saved"
    end

    mal_nest_profesiones = get_data_from_table(statements, 'mal_nest_profesiones')
    mal_nest_profesiones.each_with_index do |prof, i|
      add_profession(prof)
      puts "#{i+=1}/#{mal_nest_profesiones.length} professions saved"
    end

    mal_nest_industrias = get_data_from_table(statements, 'mal_nest_industrias')
    mal_nest_industrias.each_with_index do |ind, i|
      add_industry(ind)
      puts "#{i+=1}/#{mal_nest_industrias.length} industrias saved"
    end

    mal_nest_imagenes_perfil = get_data_from_table(statements, 'mal_nest_imagenes_perfil')

    industrias = {}
    mal_nest_industrias.each{|i| industrias[i['id']] = Industria.find_by_nombre(i['nombre']).id}
    mal_nest_empresas = get_data_from_table(statements, 'mal_nest_empresas')
    mal_nest_empresas.each_with_index do |emp, i|
      add_empresa(industrias, mal_nest_imagenes_perfil, emp)
      puts "#{i+=1}/#{mal_nest_empresas.length} empresas saved"
    end

    mal_nest_profesionales = get_data_from_table(statements, 'mal_nest_profesionales')
    mal_nest_profesionales.each_with_index do |prof, i|
      add_profesional(mal_nest_imagenes_perfil, prof)
      puts "#{i+=1}/#{mal_nest_profesionales.length} profesionales saved"
    end
  end

  def get_array(*p)
    return p
  end

  def get_time(time_param)
    Time.parse(time_param) unless time_param == '0000-00-00 00:00:00'
  end

  def add_profession(params)
    Profesion.find_or_create_by(generico: params['generico']) do |prof|
      prof.masculino = params['masculino']
      prof.femenino = params['femenino']
    end
  end

  def add_industry(params)
    Industria.find_or_create_by(nombre: params['nombre'])
  end

  def add_empresa(industrias, imagenes, params)
    Empresa.find_or_create_by(nombre: params['nombre']) do |emp|
      emp.industria_id = industrias[params['industria']]
      emp.pais = params['pais']
      emp.especialidades = params['especialidades']
      emp.descripcion = params['descripcion']
      emp.direccion = params['direccion']
      emp.telefono = params['telefono']
      emp.telefono2 = params['telefono_2']
      emp.email = params['email']
      emp.website = params['website']
      emp.servicios = params['servicios']
      emp.horario = params['horario']
      emp.facebook = params['facebook']
      emp.twitter = params['twitter']
      emp.instagram = params['instagram']
      emp.linkedin = params['linkedin']
      emp.pinterest = params['pinterest']
      emp.empleados = params['empleados']
      emp.fundacion = params['fundacion']
      emp.user_id = params['created_by']
      begin
        emp.avatar = get_imagen(imagenes, 'empresa', 'perfil', params['id'])
      rescue
        puts 'image error'
      end
      begin
        emp.page_img = get_imagen(imagenes, 'empresa', 'pagina', params['id'])
      rescue
        puts 'image error'
      end
    end
  end

  def get_file_uri path, file
    site_url = 'http://www.comunidadnest.com/'
    URI.parse("#{site_url}#{path}#{file}") unless file.to_s.empty?
  end

  def get_imagen imagenes, perfil, tipo, id
    image = imagenes.find{ |i| i['perfil'] == perfil && i['tipo'] == tipo && i['id_perfil'] == id.to_s }
    image_url = image['imagen'] if image
    get_file_uri('images/nest-perfiles/', image_url)
  end

  def add_profesional(imagenes, params)
    estados_civiles = {'soltero' => 0, 'casado' => 2, 'divorciado' => 0, 'union_libre' => 2}
    generos = { 'masculino' => 0, 'femenino' => 1 }
    Profesional.find_or_create_by(email: params['email']) do |prof|
      prof.especialidades = params['otras_especialidades']
      prof.descripcion = params['descripcion']
      prof.profesion_id = params['profesion']
      prof.nombre = params['nombre']
      prof.telefono = params['telefono']
      prof.movil = params['telefono_movil']
      prof.website = params['website']
      prof.facebook = params['facebook']
      prof.twitter = params['twitter']
      prof.instagram = params['instagram']
      prof.pinterest = params['pinterest']
      prof.linkedin = params['linkedin']
      prof.pais = params['pais']
      prof.ciudad = params['ciudad']
      prof.user = User.find(params['created_by'])
      prof.otros = params['otros']
      prof.genero = generos[params['genero']]
      begin
        prof.nacimiento = Date.parse(params['nacimiento'])
      rescue
        puts 'bad date'
      end
      prof.estado_civil = estados_civiles[params['estado_civil']]
      prof.idiomas = params['idiomas'].split(',')
      prof.intereses = params['intereses']
      prof.cfia = params['cfia']
      begin
        prof.avatar = get_imagen(imagenes, 'profesional', 'perfil', params['id'])
      rescue
        p "image error"
      end
      begin
        prof.page_img = get_imagen(imagenes, 'profesional', 'pagina', params['id'])
      rescue
        p 'image error'
      end
    end
  end

  def add_user(params)
    User.find_or_create_by(username: params['username']) do |user|
      user.email = params['email']
      user.username = params['username']
      user.password = '12345678'
      user.encrypted_password = params['password']
      user.created_at = get_time(params['registerDate'])
      user.last_sign_in_at = get_time(params['lastvisitDate'])
      user.nombre = params['name']
    end
  end

  def add_blog_entry(params, category)
    site_url = 'http://www.comunidadnest.com/'
    blog = Blog.find_by(alias: params['alias'])
    unless blog
      blog = Blog.new(
        title: params['title'],
        alias: params['alias'],
        introtext: params['introtext'],
        fulltext: params['fulltext'],
        metakey: params['metakey'],
        metadesc: params['metadesc'],
        publish_up: get_time(params['publish_up']),
        created_at: get_time(params['created']),
        updated_at: get_time(params['modified'])
      )
      begin
        image_path = JSON.parse(params['images'])['image_intro']
        blog.image_intro = URI.parse("#{site_url}#{image_path}") unless image_path.empty?
      rescue => error
        puts("ERROR ===>> #{error.class} and #{error.message}")
      end
      begin
        image_path = JSON.parse(params['images'])['image_fulltext']
        blog.image_fulltext = URI.parse("#{site_url}#{image_path}") unless image_path.empty?
      rescue => error
        puts("ERROR ===>> #{error.class}: #{error.message}")
      end
      blog.tag_list.add(category)
      blog.save!
    end
  end

  def get_data_from_table(statements, table)
    data = []
    statements.each do |statement|
      if statement =~ Regexp.new("INSERT INTO `#{table}`.+")
        columns = statement.match(/ \(.+\) VALUES/).to_s[0..-7].gsub(/[`\(\)\s]/, '').split(',')
        value_strings = statement.scan(/\(.+\)(?=,$|$)/)
        value_strings.each do |str|
          values = eval("get_array#{str}")
          hash = {}
          values.each_with_index do |value, i|
            hash[columns[i]] = value
          end
          data << hash
        end
      end
    end
    data
  end
end