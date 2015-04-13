require 'aruba/rspec'

describe 'Command Line Interface' do
  context 'when working as intended' do
    it 'takes a username and returns their favourite language' do
      expect(`bin/favelang AdamWhittingham`).to eq "Ruby\n"
    end

    it 'exits with code 0 for sucessful runs' do
      expect{`bin/favelang AdamWhittingham`}.to have_exit_status 0
    end
  end

  context 'when a an arguement is ommited' do
    it 'exits with code 1' do
      expect{`bin/favelang`}.to have_exit_status 1
    end

    it 'displays help if no arguments are given' do
      expect{`bin/favelang`}.to output("Usage: favelang <github-username>\n").to_stderr_from_any_process
    end
  end

  context 'when the username given is invalid' do
    it 'exits with code 2' do
      expect{`bin/favelang invalid_user`}.to have_exit_status 2
    end

    it 'displays an error message' do
      expect{`bin/favelang invalid_user`}.to output(/The user 'invalid_user' cannot be found/).to_stderr_from_any_process
    end
  end

end
