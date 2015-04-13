require 'github_favelang'

describe GithubFaveLang do
  let(:user){ 'AdamWhittingham' }

  describe '#repos_for_user' do
    it 'returns repo urls for a given user' do
      expect(subject.repos_for_user(user)).to include "https://github.com/#{user}/vim-config"
    end
  end

  describe '#repo_main_language' do
    it 'reutns the main language for a repository'
  end
end
