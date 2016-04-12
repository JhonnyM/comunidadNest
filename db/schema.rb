# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160304004608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "blogs", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "title"
    t.string   "alias"
    t.text     "introtext"
    t.text     "fulltext"
    t.string   "metakey"
    t.string   "metadesc"
    t.datetime "publish_up"
    t.string   "image_intro_file_name"
    t.string   "image_intro_content_type"
    t.integer  "image_intro_file_size"
    t.datetime "image_intro_updated_at"
    t.string   "image_fulltext_file_name"
    t.string   "image_fulltext_content_type"
    t.integer  "image_fulltext_file_size"
    t.datetime "image_fulltext_updated_at"
    t.integer  "status"
  end

  create_table "cutom_participantes", force: :cascade do |t|
    t.integer  "proyecto_id"
    t.string   "tipo"
    t.string   "nombre"
    t.string   "rol"
    t.integer  "auorizado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "educaciones", force: :cascade do |t|
    t.integer  "profesional_id"
    t.string   "institucion"
    t.string   "titulo"
    t.string   "fecha"
    t.string   "pais"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "empleados_empresas", force: :cascade do |t|
    t.integer  "empresa_id"
    t.integer  "profesional_id"
    t.integer  "status"
    t.string   "puesto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "empleados_empresas", ["empresa_id", "profesional_id"], name: "index_empleados_empresas", using: :btree

  create_table "empresas", force: :cascade do |t|
    t.integer  "status"
    t.integer  "user_id"
    t.string   "nombre"
    t.integer  "industria_id"
    t.text     "especialidades"
    t.string   "pais"
    t.text     "descripcion"
    t.text     "servicios"
    t.text     "horario"
    t.integer  "empleados"
    t.integer  "fundacion"
    t.text     "direccion"
    t.string   "email"
    t.string   "telefono"
    t.string   "telefono2"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "pinterest"
    t.string   "linkedin"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "page_img_file_name"
    t.string   "page_img_content_type"
    t.integer  "page_img_file_size"
    t.datetime "page_img_updated_at"
    t.string   "portafolio_file_name"
    t.string   "portafolio_content_type"
    t.integer  "portafolio_file_size"
    t.datetime "portafolio_updated_at"
  end

  create_table "empresas_proyectos", force: :cascade do |t|
    t.integer "empresa_id"
    t.integer "proyecto_id"
    t.string  "rol"
    t.integer "auorizado"
  end

  add_index "empresas_proyectos", ["empresa_id", "proyecto_id"], name: "index_empresas_proyectos", using: :btree

  create_table "estudios", force: :cascade do |t|
    t.integer  "profesional_id"
    t.string   "institucion"
    t.string   "titulo"
    t.integer  "fecha"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "pais"
  end

  create_table "experiencias", force: :cascade do |t|
    t.integer  "profesional_id"
    t.string   "empresa"
    t.string   "puesto"
    t.string   "inicio"
    t.string   "salida"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "industrias", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licitacion_imagenes", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "imagen"
    t.integer  "licitacion_id"
    t.string   "licitacion_token"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  create_table "licitacions", force: :cascade do |t|
    t.string   "titulo"
    t.string   "pais"
    t.integer  "cantidad"
    t.string   "unidad_medida"
    t.integer  "productos_categoria_id"
    t.text     "especificaciones"
    t.integer  "precio_minimo"
    t.integer  "precio_maximo"
    t.string   "tipo_de_cambio"
    t.date     "entrega"
    t.date     "plazo"
    t.text     "observaciones"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "documento_file_name"
    t.string   "documento_content_type"
    t.integer  "documento_file_size"
    t.datetime "documento_updated_at"
    t.integer  "empresa_id"
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "participante_proyectos", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "proyecto_id"
    t.string   "participante_type"
    t.integer  "participante_id"
    t.string   "nombre"
    t.string   "rol"
    t.string   "autorizado"
  end

  create_table "producto_imagenes", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "imagen"
    t.integer  "producto_id"
    t.string   "producto_token"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  create_table "productos", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "propietario_id"
    t.string   "propietario_tipo"
    t.integer  "productos_categoria_id"
    t.string   "materiales"
    t.string   "diseñador"
    t.string   "codigo"
    t.string   "pais"
    t.text     "descripcion"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "productos_categorias", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos_proyectos", force: :cascade do |t|
    t.integer "producto_id"
    t.integer "proyecto_id"
    t.string  "rol"
    t.integer "auorizado"
  end

  add_index "productos_proyectos", ["producto_id", "proyecto_id"], name: "index_productos_proyectos", using: :btree

  create_table "profesionales", force: :cascade do |t|
    t.integer  "status"
    t.integer  "user_id"
    t.string   "nombre"
    t.text     "especialidades"
    t.text     "descripcion"
    t.string   "email"
    t.string   "telefono"
    t.string   "movil"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "pinterest"
    t.string   "linkedin"
    t.string   "pais"
    t.string   "ciudad"
    t.text     "otros"
    t.integer  "genero"
    t.date     "nacimiento"
    t.integer  "estado_civil"
    t.text     "intereses"
    t.string   "cfia"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "page_img_file_name"
    t.string   "page_img_content_type"
    t.integer  "page_img_file_size"
    t.datetime "page_img_updated_at"
    t.string   "curriculum_file_name"
    t.string   "curriculum_content_type"
    t.integer  "curriculum_file_size"
    t.datetime "curriculum_updated_at"
    t.string   "portafolio_file_name"
    t.string   "portafolio_content_type"
    t.integer  "portafolio_file_size"
    t.datetime "portafolio_updated_at"
    t.text     "idiomas"
    t.integer  "profesion_id"
  end

  create_table "profesionales_profesiones", id: false, force: :cascade do |t|
    t.integer "profesional_id"
    t.integer "profesion_id"
  end

  add_index "profesionales_profesiones", ["profesional_id", "profesion_id"], name: "index_profesionales_profesiones", using: :btree

  create_table "profesionales_proyectos", force: :cascade do |t|
    t.integer "profesional_id"
    t.integer "proyecto_id"
    t.string  "rol"
    t.integer "auorizado"
  end

  add_index "profesionales_proyectos", ["profesional_id", "proyecto_id"], name: "index_profesionales_proyectos", using: :btree

  create_table "profesiones", force: :cascade do |t|
    t.string   "generico"
    t.string   "masculino"
    t.string   "femenino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profesiones_vacantes_trabajos", id: false, force: :cascade do |t|
    t.integer "profesion_id"
    t.integer "vacantes_trabajos_id"
  end

  add_index "profesiones_vacantes_trabajos", ["profesion_id", "vacantes_trabajos_id"], name: "index_profesiones_vancantes_trabajos", using: :btree

  create_table "proyecto_imagenes", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.integer  "proyecto_id"
    t.string   "imagen"
    t.string   "proyecto_token"
    t.string   "descripcion"
  end

  create_table "proyectos", force: :cascade do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.string   "pais"
    t.string   "ciudad"
    t.integer  "area"
    t.integer  "fecha"
    t.string   "status_proyecto"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "propietario_id"
    t.string   "propietario_tipo"
    t.integer  "cover"
  end

  create_table "proyectos_categorias", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proyectos_proyectos_categorias", force: :cascade do |t|
    t.integer  "proyecto_id"
    t.integer  "proyectos_categoria_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "proyectos_proyectos_categorias", ["proyecto_id"], name: "index_proyectos_proyectos_categorias_on_proyecto_id", using: :btree
  add_index "proyectos_proyectos_categorias", ["proyectos_categoria_id"], name: "index_proyectos_proyectos_categorias_on_proyectos_categoria_id", using: :btree

  create_table "recomendados", force: :cascade do |t|
    t.integer  "perfil_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comentario"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
  end

  add_index "reviews", ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id", using: :btree

  create_table "slides", force: :cascade do |t|
    t.string   "titulo"
    t.string   "titulo_bold"
    t.string   "autor"
    t.string   "pais"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "status"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.string   "link"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "nombre"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vacantes_trabajos", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "empresa_id"
    t.string   "pais"
    t.text     "descripcion"
    t.string   "puesto"
    t.text     "descripcion_puesto"
    t.text     "requisitos"
    t.string   "tiempo"
    t.string   "salario"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
