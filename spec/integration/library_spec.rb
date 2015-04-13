require 'github_favelang'

describe GithubFaveLang, type: :integration do

  it 'returns the favourite language for a Rubyist' do
    expect(subject.favoute_language('AdamWhittingham')).to eq 'Ruby'
  end

  it 'returns the favourite language for a Javascripter' do
    expect(subject.favoute_language('atleastimtrying')).to eq 'JavaScript'
  end

end
