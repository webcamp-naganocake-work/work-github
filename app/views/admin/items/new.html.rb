<h1>商品新規登録</h1>
  <%= form_with model: @image,url: '/admin/items', method: :post do |f| %>
    <h4>商品画像</h4>
      <%= f.file_field :image, accept: "image/*" %>
    <h4>商品名</h4>
      <%= f.text_field :name %>
    <h4>商品説明</h4>
      <%= f.text_area :introduction %>
    <h4>ジャンル</h4>
      <%= f.text_area :genre %>
    <h4>税抜価格</h4>
      <%= f.text_area :price %>
    <h4>販売ステータス</h4>
      <%= f.text_area :is_active %>
    <%= f.submit '新規登録' %>
  <% end %>