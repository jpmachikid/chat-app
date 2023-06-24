require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されている' do
    # サインインする
    sign_in(@room_user.user)

    # 作成されたチャットルームへ遷移する
    click_on(@room_user.room.name)

    # メッセージ情報を5つDBに追加する
    FactoryBot.create_list(:message,5,content: 'test',room_id: @room_user.room_id,user_id: @room_user.user_id)
    # 「チャットを終了する」ボタンをクリックすることで、作成した5つのメッセージが削除されていることを確認する
    expect{
      click_on('チャットを終了する')
      sleep 1
    }.to change{Message.count}.by(-5)
    # トップページに遷移していることを確認する
    expect(current_path).to eq(root_path)
  end
end

