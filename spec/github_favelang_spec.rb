require 'github_favelang'

describe GithubFaveLang do
  let(:user){ 'AdamWhittingham' }
  let(:vim_repo) { "https://github.com/#{user}/vim-config" }

  describe '#repos_for_user' do
    let(:repos) { subject.repos_for_user(user) }

    it 'returns repos for a given user' do
      expect(repos.map{|r| r.html_url}).to include vim_repo
    end

  end

  describe '#repos_per_language' do
    let (:vim_repo)  { {language: 'vim'} }
    let (:ruby_repo) { {language: 'ruby'} }
    let (:nil_repo)  { {language: nil} }
    let (:example_input) {
      [ vim_repo, ruby_repo, nil_repo, ruby_repo ]
    }

    it 'returns the count each language was seen' do
      result = subject.repos_per_language(example_input)
      expect(result).to eq({'ruby' => 2, 'vim' => 1})
    end
  end

end
