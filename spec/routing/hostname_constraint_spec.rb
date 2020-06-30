require 'rails_helper'

describe 'ルーティング' do
  let(:config) { Rails.application.config.baukis2 }

  context 'baukis2.example.comに接続したら' do
    let(:url) { "http://#{config[:staffs][:host]}/#{config[:staffs][:path]}" }

    example '職員トップページ' do
      expect(get: url).to route_to(
        host: 'baukis2.example.com',
        controller: 'staffs/top',
        action: 'index'
      )
    end
  end

  context 'baukis2.example.com/adminsに接続したら' do
    let(:url) { "http://#{config[:admins][:host]}/#{config[:admins][:path]}" }

    example '管理者ログインフォーム' do
      expect(get: url).to route_to(
        host: 'baukis2.example.com',
        controller: 'admins/top',
        action: 'index'
      )
    end
  end

  context '許可されてないホスト名で接続したら' do
    let(:url) { 'http://foo.example.com' }

    example 'routingできない' do
      expect(get: url).not_to be_routable
    end
  end

  context '存在しないパスに接続したら' do
    let(:url) { 'http://baukis2.example.com/nonono' }

    example 'routingできない' do
      expect(get: url).not_to be_routable
    end
  end
end
