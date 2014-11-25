require 'rails_helper'

describe JobCard, type: :model do
  let!(:group) { create(:group) }
  let!(:user) { create(:user) }
  let!(:job_card) { create_list(:job_card, 4, user: user, group: group) }

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
        @todo = Todo.new(title: 'テスト', description: 'これはテスト', point: 1,  user: user, group: group)
        @todo.save(context: :todo)
      end

      it 'typeカラムにtodoがセットされている' do
        expect(@todo.type).to eq('Todo')
      end
    end

    context 'doingの場合' do
      before do
        @doing = Doing.new(title: 'テストdoing', description: 'これもテスト', point: 2, user: user, group: group)
        @doing.save(context: :doing)
      end

      it 'typeカラムにdoingがセットされている' do
        expect(@doing.type).to eq('Doing')
      end
    end

    context 'doneの場合' do
      before do
        @done = Done.new(title: 'テストdoing', description: 'これもテスト', point: 2, user: user, group: group)
        @done.save(context: :done)
      end

      it 'typeカラムにdoneがセットされている' do
        expect(@done.type).to eq('Done')
      end
    end
  end
end
