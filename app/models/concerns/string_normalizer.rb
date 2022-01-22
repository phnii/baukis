require "nkf"

module StringNormalizer
  extend ActiveSupport::Concern

  def normalize_as_name(text)
    NKF.nkf("-W -w -Z1", text).strip if text
  end

  def normalize_as_furigana(text)
    NKF.nkf("-W -w -Z1 --kanakana", text).strip if text
  end

  def normalize_ad_email(text)
    NKF.nkf("-W -w -Z1", text).strip if text
  end
end