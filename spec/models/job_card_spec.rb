require 'rails_helper'

describe JobCard, type: :model do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:job_card) { create_list(:job_card, 4, user: user, group: group) }

  describe '幾つかのテーブルと関連を持っている' do
    context 'have a relation to user class' do
      it { expect belong_to(:users) }
    end

    context 'have a relation to group class' do
      it { expect belong_to(:groups) }
    end
  end

  describe '入力チェックをする' do
    context 'title' do
      it { expect validate_presence_of(:title) }
      it { expect ensure_length_of(:title).is_at_most(60) }
    end

    context 'point' do
      it { expect validate_presence_of(:point) }
      it { expect validate_numericality_of(:point) }
    end
  end

  describe 'Type毎の登録を確認' do
    context 'todoの場合' do
      before do
        @todo = JobCard.new(title: 'テスト', description: 'これはテスト', point: 1,  user: user, group: group)
        @todo.type = :todo
        @todo.save(context: :todo)
      end

      it 'typeカラムにtodoがセットされている' do
        expect(@todo.todo?).to be_truthy
      end
    end

    context 'doingの場合' do
      before do
        @doing = JobCard.new(title: 'テストdoing', description: 'これもテスト', point: 2, user: user, group: group)
        @doing.type = :doing
        @doing.save(context: :doing)
      end

      it 'typeカラムにdoingがセットされている' do
        expect(@doing.doing?).to be_truthy
      end
    end

    context 'doneの場合' do
      before do
        @done = JobCard.new(title: 'テストdoing', description: 'これもテスト', point: 2, user: user, group: group)
        @done.type = :done
        @done.save(context: :done)
      end

      it 'typeカラムにdoneがセットされている' do
        expect(@done.done?).to be_truthy
      end
    end
  end
end
