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

  describe '正規化' do
    context 'emailの前後に全角空白が含まれている場合' do
      it '空白は削除される' do
        staff = FactoryBot.create(:staff, email: "\u{3000}test@example.com\u{3000}")

        expect(staff.email).to eq('test@example.com')
      end
    end

    context 'emailに全角文字が含まれている場合' do
      it '半角に変換される' do
        staff = FactoryBot.create(:staff, email: 'ｔest＠ｅxample.com')

        expect(staff.email).to eq('test@example.com')
      end
    end

    context 'family_name_kanaがひらがなで入力された場合' do
      it 'カタカナに変換される' do
        staff = FactoryBot.create(:staff, family_name_kana: 'かたかな')

        expect(staff.family_name_kana).to eq('カタカナ')
      end
    end

    context 'family_name_kanaが半角カタカナで入力された場合' do
      it '全角カタカナに変換される' do
        staff = FactoryBot.create(:staff, family_name_kana: 'ｶﾀｶﾅ')

        expect(staff.family_name_kana).to eq('カタカナ')
      end
    end
  end
end
