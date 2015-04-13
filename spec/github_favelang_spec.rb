require 'github_favelang'

describe GithubFaveLang do
  let(:user){ 'AdamWhittingham' }
  let(:invalid_user){ "invalid_user" }
  let(:vim_repo) { "https://github.com/#{user}/vim-config" }

  describe '#repos_for_user' do

    it 'returns repos for a given user' do
      repos =  subject.repos_for_user(user)
      expect(repos.map{|r| r.html_url}).to include vim_repo
    end

    it 'raises an ArguementError if the username is invalid' do
      expected_message  = "The user '#{invalid_user}' cannot be found"
      expect{subject.repos_for_user(invalid_user)}.to raise_error(ArgumentError, expected_message)
    end

  end

  describe '#repos_per_language' do
    let (:vim_repo)  { {language: 'vim'} }
    let (:ruby_repo) { {language: 'ruby'} }
    let (:nil_repo)  { {language: nil} }

    it 'returns the count each language was seen' do
      input = [ vim_repo, ruby_repo, nil_repo, ruby_repo ]
      result = subject.repos_per_language(input)
      expect(result).to eq({'ruby' => 2, 'vim' => 1})
    end
  end

  describe '#most_popular' do
    it 'returns the key for the highest value' do
      input = { 'Elixir' => 10, 'Ruby' => 100, 'Python' => 50 }
      result = subject.most_popular(input)
      expect(result).to eq 'Ruby'
    end
  end

end
