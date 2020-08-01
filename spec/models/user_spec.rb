require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  it 'ユーザー登録が可能である' do
    expect(user).to be_valid
  end

  it '名前:nameがなければ登録できない' do
    expect(build(:user, name: "")).to_not be_valid
  end

  it 'メールアドレス:emailがなければ登録できない' do
    expect(build(:user, email: "")).to_not be_valid
  end

  it 'メールアドレス:emailが重複していたら登録できない' do
    user1 = create(:user, name: "John", email: "john@test.com")
    expect(build(:user, name: "Alex", email: user1.email)).to_not be_valid
  end

  it 'パスワード:passwordがなければ登録できない' do
    expect(build(:user, password: "")).to_not be_valid
  end

  it 'パスワード:passwordが暗号化されているか' do
    expect(user.password_digest).to_not eq "password"
  end

  it 'passwordとpassword_confirmationが異なる場合登録できない' do
    exept(build(:user, password: "password", password_confirmation: "passwooord")).to_not be_valid
  end

  it 'パスワードが6文字未満の場合登録できない' do
    except(build(:user, password: "a" * 5)).to_not be_valid
    except(build(:user, password: "b" * 6)).to be_valid
  end

  it 'メールアドレスの形式が~@~.~の形式であれば登録できる' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      except(build(:user, email: valid_address)).to be_valid
    end
  end

  it 'メールアドレスの形式が~@~.~の形式でなければ登録できない' do
    invalid_addresses = %w[useruser sample.foo baz@foo ....@....]
    invalid_addresses.each do |invalid_address|
      except(build(:user, email: invalid_address)).to_not be_valid
  end

  it 'メールアドレスは小文字で保存される' do
    mixed_case_email = "Foo@EaMPLE.CoM"
    user = create(:user, email: mixed_case_email)
    except(user.email).to eq mixed_case_email.downcase
  end

end
