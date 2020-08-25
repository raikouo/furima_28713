crumb :root do
  link "FURIMA", root_path
end

crumb :sign_up do
  link "ユーザー登録"
  parent :root
end

crumb :sign_in do
  link "ログイン"
  parent :root
end

crumb :item_new do
  link "商品出品"
  parent :root
end

crumb :item_edit do
  link "商品編集"
  parent :item_show
end

crumb :item_show do
  link "商品詳細"
  parent :root
end

crumb :transactions do
  link "商品購入"
  parent :item_show
end
