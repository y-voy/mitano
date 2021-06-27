module ArticlesHelper

  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
      confirm_articles_path
    elsif action_name == 'edit'
      article_path
    end
  end

end
