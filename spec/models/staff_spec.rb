require 'rails_helper'

RSpec.describe Staff, type: :model do
  describe 'バリデーション' do
    subject { FactoryBot.build(:staff, params) }

    context 'emailが@を2個含む' do
      let(:params) { { email: 'test@@example.com' } }

      it '無効' do
        is_expected.not_to be_valid
      end
    end

    context 'family_name_kanaが漢字を含む' do
      let(:params) { { family_name_kana: '漢字テスト' } }

      it '無効' do
        is_expected.not_to be_valid
      end
    end

    context 'family_name_kanaが長音符を含む' do
      let(:params) { { family_name_kana: 'エリー' } }

      it '有効' do
        is_expected.to be_valid
      end
    end

    context 'emailが重複してる場合' do
      before do
        FactoryBot.create(:staff, email: 'test@email.com')
      end
      let(:params) { { email: 'test@email.com' } }

      it '無効' do
        is_expected.not_to be_valid
      end
    end
  end
end
