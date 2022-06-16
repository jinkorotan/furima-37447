require 'rails_helper'

RSpec.describe Item, type: :model do
  has_one_attached :ファイル名
end
