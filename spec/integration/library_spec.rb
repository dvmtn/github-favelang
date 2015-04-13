require 'github_favelang'

describe GithubFaveLang, type: :integration do

  it 'returns the favourite language for a Rubyist' do
    expect(subject.favourite_language('AdamWhittingham')).to eq 'Ruby'
  end

  it 'returns the favourite language for a Javascripter' do
    expect(subject.favourite_language('atleastimtrying')).to eq 'JavaScript'
  end

end
