# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2022_02_23_154129) do
=======
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2022_02_22_184428) do
=======
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2022_02_17_202121) do
>>>>>>> 8432aaba1079322be43561db543662d4a4c97b6d
>>>>>>> a101ee809b3ebc6e9dd3d434b8039b6b995a4534

=======
ActiveRecord::Schema.define(version: 2022_02_10_213706) do
  
>>>>>>> 2f6376b1181f7ec4ef6a6621b7965f26b1efaf93
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> a101ee809b3ebc6e9dd3d434b8039b6b995a4534
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

<<<<<<< HEAD
=======
=======
>>>>>>> 8432aaba1079322be43561db543662d4a4c97b6d
>>>>>>> a101ee809b3ebc6e9dd3d434b8039b6b995a4534
  create_table "addresses", force: :cascade do |t|
    t.string "area"
    t.string "city"
    t.string "state"
    t.integer "pincode"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

<<<<<<< HEAD
  create_table "cartitems", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cartitems_on_cart_id"
    t.index ["product_id"], name: "index_cartitems_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "total"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 8432aaba1079322be43561db543662d4a4c97b6d
>>>>>>> a101ee809b3ebc6e9dd3d434b8039b6b995a4534
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "stock"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
=======
>>>>>>> 2f6376b1181f7ec4ef6a6621b7965f26b1efaf93
>>>>>>> 8432aaba1079322be43561db543662d4a4c97b6d
>>>>>>> a101ee809b3ebc6e9dd3d434b8039b6b995a4534
  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

<<<<<<< HEAD
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "cartitems", "carts"
  add_foreign_key "cartitems", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "products", "categories"
=======
<<<<<<< HEAD
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "products", "categories"
=======
  add_foreign_key "addresses", "users"
<<<<<<< HEAD
  add_foreign_key "products", "categories"
=======
>>>>>>> 2f6376b1181f7ec4ef6a6621b7965f26b1efaf93
>>>>>>> 8432aaba1079322be43561db543662d4a4c97b6d
>>>>>>> a101ee809b3ebc6e9dd3d434b8039b6b995a4534
end
