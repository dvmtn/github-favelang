require 'github_favelang'
require 'aruba/rspec'

describe 'Command Line Interface' do
  it 'takes a username and returns their favourite language' do
    expect(`favelang AdamWhittingham`).to shellout 'Ruby'
  end

  it 'exits with code 0 for sucessful runs' do
    expect(`favelang AdamWhittingham`).to have_exit_status 0
  end

  it 'exits with code 1 for bad usernames' do
    expect (`favelang 0`).to have_exit_status 1
  end

  it 'displays help if no arguments are given' do
    expect (`favelang`).to shellout 'favelang <github-username>'
  end
end
