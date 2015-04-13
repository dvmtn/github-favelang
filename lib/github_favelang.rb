require 'octokit'

class GithubFaveLang

  def favourite_language username
    repos = repos_for_user username
    languages = repos_per_language(repos)
    most_popular languages
  end

  def repos_for_user username
    user = get_user(username)
    user_repos = user.rels[:repos].get
    user_repos.data
  end

  def repos_per_language repos
    repos
      .map{|repo| repo[:language]}
      .compact
      .each_with_object(Hash.new(0)) { |lang, counts| counts[lang] += 1 }
  end

  def most_popular hash
    hash
      .max_by{|k,v| v}
      .first
  end

  def get_user username
    begin
      Octokit.user(username)
    rescue Octokit::NotFound
      raise ArgumentError.new("The user '#{username}' cannot be found")
    end
  end

end
