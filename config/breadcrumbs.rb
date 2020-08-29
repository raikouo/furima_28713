crumb :root do
  link "FURIMA", root_path
end

crumb :sign_up do
  link "ユーザー登録", new_user_registration_path
  parent :root
end

crumb :sign_in do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :item_new do
  link "商品出品", new_item_path
  parent :root
end

crumb :item_show do |item|
  link "#{item.id}：#{item.name}", item_path(item)
  parent :root
end

crumb :search do |result|
  link "商品検索：#{result.count} 件", search_items_path
  parent :root
end

crumb :item_edit do |item|
  link "編集", edit_item_path(item)
  parent :item_show, item
end

crumb :transactions do |item|
  link "購入: #{item.price}円", item_transactions_path(item)
  parent :item_show, item
end
