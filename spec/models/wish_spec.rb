# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Wish, type: :model do
  describe '#remind_at_cannot_be_in_the_past' do
    let(:wish) { Wish.new(remind_at:) }

    context 'remind_atが過去の場合' do
      let(:remind_at) { 1.day.ago }

      it 'remind_atにエラーが追加される' do
        wish.valid?
        expect(wish.errors[:remind_at]).to include('過去にリマインダーを設定することはできません')
      end
    end

    context 'remind_atが未来の場合' do
      let(:remind_at) { 1.day.from_now }

      it 'remind_atにエラーが追加されない' do
        wish.valid?
        expect(wish.errors[:remind_at]).to be_empty
      end
    end

    context 'remind_atがnilの場合' do
      let(:remind_at) { nil }

      it 'remind_atにエラーが追加されない' do
        wish.valid?
        expect(wish.errors[:remind_at]).to be_empty
      end
    end
  end
end
