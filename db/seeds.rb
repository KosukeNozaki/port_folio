# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
	email: 'admin@admin.com',
	password: 'admin_user'
	)
Customer.create!(
	last_name: 'てすと',
	first_name: '太郎',
	last_name_kana: 'テスト',
	first_name_kana: 'タロウ',
	email: 'test@user',
	password: 'test11',
	postal_code: '111-2222',
	address: '大阪東京京都',
	telephone_number: '111-2222-3333',
	is_active: 'true'
 	)
 Genre.create!(
 	name: '緑',
 	is_active: 'true'
 	)
Address.create!(
	customer_id: '1',
	name: 'テストネーム',
	postal_code: '666-7777',
	address: 'テスト府テスト市'
	)
Card.create!(
	genre_id: '1',
	name: 'テスト',
	introduction: 'テストせつめい',
	price: '300',
	is_active: 'true'
	)