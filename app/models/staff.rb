class Staff < ApplicationRecord
  include StringNormalizer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :staff_event_histories, dependent: :destroy

  before_validation do
    self.email = normalize_as_email(email)
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/.freeze

  validates :email, presence: true, 'valid_email_2/email': true, uniqueness: { case_sensitive: false }
  validates :family_name, :given_name, presence: true
  validates :family_name_kana, :given_name_kana, presence: true,
                                                 format: { with: KATAKANA_REGEXP, allow_blank: true }
  validates :start_date, presence: true, date: {
    after_or_equal_to: Date.new(2000, 1, 1),
    before: ->(_obj) { 1.year.from_now.to_date },
    allow_blank: true
  }
end
